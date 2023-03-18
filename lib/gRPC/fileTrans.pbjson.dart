///
//  Generated code. Do not modify.
//  source: fileTrans.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use uploadFileStructDescriptor instead')
const UploadFileStruct$json = const {
  '1': 'UploadFileStruct',
  '2': const [
    const {'1': 'meta', '3': 1, '4': 1, '5': 11, '6': '.fileTransfer.UploadFileStruct.FileMeta', '9': 0, '10': 'meta'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.fileTransfer.UploadFileStruct.FileData', '9': 0, '10': 'data'},
  ],
  '3': const [UploadFileStruct_FileMeta$json, UploadFileStruct_FileData$json],
  '8': const [
    const {'1': 'file'},
  ],
};

@$core.Deprecated('Use uploadFileStructDescriptor instead')
const UploadFileStruct_FileMeta$json = const {
  '1': 'FileMeta',
  '2': const [
    const {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
  ],
};

@$core.Deprecated('Use uploadFileStructDescriptor instead')
const UploadFileStruct_FileData$json = const {
  '1': 'FileData',
  '2': const [
    const {'1': 'size', '3': 1, '4': 1, '5': 5, '10': 'size'},
    const {'1': 'binarydata', '3': 2, '4': 1, '5': 12, '10': 'binarydata'},
  ],
};

/// Descriptor for `UploadFileStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadFileStructDescriptor = $convert.base64Decode('ChBVcGxvYWRGaWxlU3RydWN0Ej0KBG1ldGEYASABKAsyJy5maWxlVHJhbnNmZXIuVXBsb2FkRmlsZVN0cnVjdC5GaWxlTWV0YUgAUgRtZXRhEj0KBGRhdGEYAiABKAsyJy5maWxlVHJhbnNmZXIuVXBsb2FkRmlsZVN0cnVjdC5GaWxlRGF0YUgAUgRkYXRhGiYKCEZpbGVNZXRhEhoKCGZpbGVuYW1lGAEgASgJUghmaWxlbmFtZRo+CghGaWxlRGF0YRISCgRzaXplGAEgASgFUgRzaXplEh4KCmJpbmFyeWRhdGEYAiABKAxSCmJpbmFyeWRhdGFCBgoEZmlsZQ==');
@$core.Deprecated('Use uploadResponseDescriptor instead')
const UploadResponse$json = const {
  '1': 'UploadResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
  ],
};

/// Descriptor for `UploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadResponseDescriptor = $convert.base64Decode('Cg5VcGxvYWRSZXNwb25zZRIWCgZyZXN1bHQYASABKAhSBnJlc3VsdA==');
