///
//  Generated code. Do not modify.
//  source: fileTrans.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'fileTrans.pb.dart' as $0;
export 'fileTrans.pb.dart';

class FileTransferClient extends $grpc.Client {
  static final _$uploadFile =
      $grpc.ClientMethod<$0.UploadFileStruct, $0.UploadResponse>(
          '/fileTransfer.FileTransfer/UploadFile',
          ($0.UploadFileStruct value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UploadResponse.fromBuffer(value));

  FileTransferClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UploadResponse> uploadFile(
      $async.Stream<$0.UploadFileStruct> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadFile, request, options: options).single;
  }
}

abstract class FileTransferServiceBase extends $grpc.Service {
  $core.String get $name => 'fileTransfer.FileTransfer';

  FileTransferServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UploadFileStruct, $0.UploadResponse>(
        'UploadFile',
        uploadFile,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadFileStruct.fromBuffer(value),
        ($0.UploadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UploadResponse> uploadFile(
      $grpc.ServiceCall call, $async.Stream<$0.UploadFileStruct> request);
}
