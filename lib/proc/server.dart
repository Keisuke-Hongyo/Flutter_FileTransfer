/* File Transfer App for android       */
/* Programed by Keisuke Hongyo         */
/* First Version Date 18.Mar 2023      */
/* Supported by Yukinko and Double SH  */

// Flutter Standard Library
import 'dart:async';
import 'dart:io';

// Package
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

// My Library
import '../gRPC/fileTrans.pbgrpc.dart';

// Server Message Stream
final StreamController<String> _srvmsg = StreamController<String>.broadcast();


class ServerSettingPage extends StatelessWidget {
  //final FileTransfer client;
  late String _port;

  void changePort(String value) {
    _port = value;
  }

  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)!.settings.arguments as String;
    _port = arg;
    _srvmsg.sink.add("");
    return Scaffold(
      resizeToAvoidBottomInset: false,  // キーボード表示時のエラー回避
      appBar: AppBar(
        title: const Text("受信ポートの設定"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      '受信ポート設定',
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
                _srvmsg.sink.add("受信ポートを変更しました。");
                Navigator.pop(context,_port);
              },
              child: const Text("ポート番号 変更")),
        ],
      ),
    );
  }
}

// ファイルサーバの設定
class FileSaveSrv {

  // プロパティ
  bool _srvState = false;
  final server = Server([UpLoader()]);
  int port;

  // インターフェス情報
  Future<List<NetworkInterface>> srvInfo = NetworkInterface.list();

  // コンストラクタ
  FileSaveSrv({
    required this.port,
  });

  // Getter
  Future<String> get ipAddress => _getIPaddress("wlan0","IPv4");
  bool get srvState => _srvState;
  StreamController<String> get srvmsg => _srvmsg;

  // Get Network Interface information
  Future<String> _getIPaddress(String nwinface,String protocol) async {
    for (var interface in await srvInfo) {
      if (interface.name == nwinface) {
        for (var addr in interface.addresses) {
          if (addr.type.name == protocol) {
            return addr.address;
          }
        }
      }
    }
    return "";
  }

  Future<void> setServer() async {
    try {
      await server.serve(port: port);
      print('Server listening on port ${server.port}...');
      _srvState = true;
    } catch (e) {
      print('Server Execute Error...');
      _srvState = false;
    }
  }

  Future<void> stopServer() async {
    await server.shutdown();
    print('Server Shout down ...');
    _srvState = false;
  }
}

// gPRC CLass
class UpLoader extends FileTransferServiceBase {
  late String path;

  @override
  Future<UploadResponse> uploadFile(
      ServiceCall call, Stream<UploadFileStruct> request) async {
    List<int> fileData = [];

    late String filename;
    try{
      // Receive data from Client
      await for (var req in request) {
        // get Filename
        if (req.meta.filename.isEmpty) {
          for (var d in req.data.binarydata) {
            fileData.add(d);
          }
        } else {
          filename = req.meta.filename;
        }
      }
      String p = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      final file = File("$p/$filename");
      await file.writeAsBytes(fileData);

      // Stream
      _srvmsg.sink.add("ファイルを受信しました。");

      // Response send to Client
      return UploadResponse()..result = true;

    } catch(e){
      return UploadResponse()..result = false;
    }
  }
}
