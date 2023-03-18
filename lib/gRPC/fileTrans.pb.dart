///
//  Generated code. Do not modify.
//  source: fileTrans.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UploadFileStruct_FileMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UploadFileStruct.FileMeta', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'fileTransfer'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filename')
    ..hasRequiredFields = false
  ;

  UploadFileStruct_FileMeta._() : super();
  factory UploadFileStruct_FileMeta({
    $core.String? filename,
  }) {
    final _result = create();
    if (filename != null) {
      _result.filename = filename;
    }
    return _result;
  }
  factory UploadFileStruct_FileMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileStruct_FileMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileStruct_FileMeta clone() => UploadFileStruct_FileMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileStruct_FileMeta copyWith(void Function(UploadFileStruct_FileMeta) updates) => super.copyWith((message) => updates(message as UploadFileStruct_FileMeta)) as UploadFileStruct_FileMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct_FileMeta create() => UploadFileStruct_FileMeta._();
  UploadFileStruct_FileMeta createEmptyInstance() => create();
  static $pb.PbList<UploadFileStruct_FileMeta> createRepeated() => $pb.PbList<UploadFileStruct_FileMeta>();
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct_FileMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileStruct_FileMeta>(create);
  static UploadFileStruct_FileMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => clearField(1);
}

class UploadFileStruct_FileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UploadFileStruct.FileData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'fileTransfer'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'binarydata', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UploadFileStruct_FileData._() : super();
  factory UploadFileStruct_FileData({
    $core.int? size,
    $core.List<$core.int>? binarydata,
  }) {
    final _result = create();
    if (size != null) {
      _result.size = size;
    }
    if (binarydata != null) {
      _result.binarydata = binarydata;
    }
    return _result;
  }
  factory UploadFileStruct_FileData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileStruct_FileData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileStruct_FileData clone() => UploadFileStruct_FileData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileStruct_FileData copyWith(void Function(UploadFileStruct_FileData) updates) => super.copyWith((message) => updates(message as UploadFileStruct_FileData)) as UploadFileStruct_FileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct_FileData create() => UploadFileStruct_FileData._();
  UploadFileStruct_FileData createEmptyInstance() => create();
  static $pb.PbList<UploadFileStruct_FileData> createRepeated() => $pb.PbList<UploadFileStruct_FileData>();
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct_FileData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileStruct_FileData>(create);
  static UploadFileStruct_FileData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get size => $_getIZ(0);
  @$pb.TagNumber(1)
  set size($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get binarydata => $_getN(1);
  @$pb.TagNumber(2)
  set binarydata($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBinarydata() => $_has(1);
  @$pb.TagNumber(2)
  void clearBinarydata() => clearField(2);
}

enum UploadFileStruct_File {
  meta, 
  data, 
  notSet
}

class UploadFileStruct extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UploadFileStruct_File> _UploadFileStruct_FileByTag = {
    1 : UploadFileStruct_File.meta,
    2 : UploadFileStruct_File.data,
    0 : UploadFileStruct_File.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UploadFileStruct', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'fileTransfer'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UploadFileStruct_FileMeta>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meta', subBuilder: UploadFileStruct_FileMeta.create)
    ..aOM<UploadFileStruct_FileData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: UploadFileStruct_FileData.create)
    ..hasRequiredFields = false
  ;

  UploadFileStruct._() : super();
  factory UploadFileStruct({
    UploadFileStruct_FileMeta? meta,
    UploadFileStruct_FileData? data,
  }) {
    final _result = create();
    if (meta != null) {
      _result.meta = meta;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory UploadFileStruct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadFileStruct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadFileStruct clone() => UploadFileStruct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadFileStruct copyWith(void Function(UploadFileStruct) updates) => super.copyWith((message) => updates(message as UploadFileStruct)) as UploadFileStruct; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct create() => UploadFileStruct._();
  UploadFileStruct createEmptyInstance() => create();
  static $pb.PbList<UploadFileStruct> createRepeated() => $pb.PbList<UploadFileStruct>();
  @$core.pragma('dart2js:noInline')
  static UploadFileStruct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadFileStruct>(create);
  static UploadFileStruct? _defaultInstance;

  UploadFileStruct_File whichFile() => _UploadFileStruct_FileByTag[$_whichOneof(0)]!;
  void clearFile() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UploadFileStruct_FileMeta get meta => $_getN(0);
  @$pb.TagNumber(1)
  set meta(UploadFileStruct_FileMeta v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeta() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeta() => clearField(1);
  @$pb.TagNumber(1)
  UploadFileStruct_FileMeta ensureMeta() => $_ensure(0);

  @$pb.TagNumber(2)
  UploadFileStruct_FileData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(UploadFileStruct_FileData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  UploadFileStruct_FileData ensureData() => $_ensure(1);
}

class UploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UploadResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'fileTransfer'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  UploadResponse._() : super();
  factory UploadResponse({
    $core.bool? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory UploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadResponse clone() => UploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadResponse copyWith(void Function(UploadResponse) updates) => super.copyWith((message) => updates(message as UploadResponse)) as UploadResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadResponse create() => UploadResponse._();
  UploadResponse createEmptyInstance() => create();
  static $pb.PbList<UploadResponse> createRepeated() => $pb.PbList<UploadResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadResponse>(create);
  static UploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

