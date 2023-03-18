/* File Transfer App for android       */
/* Programed by Keisuke Hongyo         */
/* First Version Date 18.Mar 2023      */
/* Supported by Yukinko and Double SH  */

// Flutter Standard Library
import 'dart:async';
import 'dart:typed_data';

// Package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

// My Library
import '../gRPC/fileTrans.pb.dart';
import '../gRPC/fileTrans.pbgrpc.dart';

// Server Message Stream
final StreamController<String> _climsg = StreamController<String>.broadcast();

// 設定変更
class ClientSettingPage extends StatelessWidget {
  //final FileTransfer client;
  late String _ipaddr;
  late String _port;


  void changeIpAddress(String value) {
    _ipaddr = value;
  }

  void changePort(String value) {
    _port = value;
  }


  @override
  Widget build(BuildContext context) {
    List<String> arg = ModalRoute.of(context)!.settings.arguments as List<String>;
    _ipaddr = arg[0];
    _port = arg[1];
    _climsg.sink.add("");
    return Scaffold(
      resizeToAvoidBottomInset: false,  // キーボード表示時のエラー回避
      appBar: AppBar(
        title: const Text("転送先設定"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0,bottom: 0),
            child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      '転送先のホスト名またはIPアドレス',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(text: _ipaddr),
                        onChanged: changeIpAddress,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      '転送先のポート番号',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: TextEditingController(text: _port),
                        keyboardType: TextInputType.number,
                        onChanged: changePort,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],),
                    ),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
                _climsg.sink.add("転送先を変更しました。");
                Navigator.pop(context, [_ipaddr, _port]);
              },
              child: const Text("転送設定 変更")),
        ],
      ),
    );
  }
}

// ファイル転送クラス
class FileTransfer {
  String address;
  int port;

  FileTransfer({
    required this.address,
    required this.port,
  });

  StreamController<String> get climsg => _climsg;

  // バッファサイズ -> 2 * 1024*1024 = 2Mib
  static const int buffer = 2 * 1024 * 1024;

// gRPCクライアント
  Future<bool> fileTrans(String filename, Uint8List data) async {
    UploadResponse res = UploadResponse();
    final channel = ClientChannel(
      address,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    // gRPCの設定　タイムアウト設定:10秒
    final stub = FileTransferClient(channel,options: CallOptions(timeout: const Duration(seconds: 40)));
    try {
      // データの送信 -> gRPCのメソッドをコール
      res = await stub.uploadFile(getStream(filename, data));
    } catch (e) {
      // エラー -> falseを返す
      res.result = false;
    } finally {
      await channel.shutdown();
    }

    // 処理結果
    return Future.value(res.result);
  }


  // Upload処理
  Stream<UploadFileStruct> getStream(String filename, Uint8List data) async* {
    int remainSize = data.length;
    int sendSize;
    int start = 0;
    int end = 0;
    yield UploadFileStruct(
        meta: UploadFileStruct_FileMeta(filename: filename)
    );

    // 転送処理
    while (true) {
      // 転送サイズの計算
      if (remainSize < buffer) {
        // バッファ以下
        end += remainSize;
        sendSize = remainSize;
        remainSize = 0;
      } else {
        // バッファ以上 -> 最大バッファに設定
        end += buffer;
        sendSize = buffer;
        remainSize -= buffer;
      }
      // データ送信
      yield UploadFileStruct(
          data: UploadFileStruct_FileData(
              size: sendSize,
              binarydata: data.sublist(start, end)
          )
      );

      // スタート位置の更新および終了処理
      if (remainSize > 0) {
        start = end;
      } else {
        // データサイズが0なら終了
        // Stream
        _climsg.sink.add("ファイルを送信しました。");
        break;
      }
    }
  }
}