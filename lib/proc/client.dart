/* File Transfer App for android       */
/* Programed by Keisuke Hongyo         */
/* First Version Date 18.Mar 2023      */
/* Supported by Yukinko and Double SH  */

// Flutter Standard Library
import 'dart:async';
import 'dart:typed_data';

// Package
import 'package:grpc/grpc.dart';

// My Library
import '../gRPC/fileTrans.pb.dart';
import '../gRPC/fileTrans.pbgrpc.dart';

// Server Message Stream
final StreamController<String> _climsg = StreamController<String>.broadcast();

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
    final stub = FileTransferClient(channel,options: CallOptions(timeout: const Duration(seconds: 10)));
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