// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:collection/collection.dart' show IterableExtension;
part of 'pb_shared_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBSharedInstanceIntermediateNode _$PBSharedInstanceIntermediateNodeFromJson(
    Map<String, dynamic> json) {
  return PBSharedInstanceIntermediateNode(
    json['UUID'] as String?,
    Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    SYMBOL_ID: json['symbolID'] as String?,
    sharedParamValues: (json['overrideValues'] as List?)
        ?.map((e) => e == null
            ? null
            : PBInstanceOverride.fromJson(e as Map<String, dynamic>))
        .toList(),
    prototypeNode: PrototypeNode.prototypeNodeFromJson(
        json['prototypeNodeUUID'] as String?),
    name: json['name'] as String?,
    sharedNodeSetID: json['sharedNodeSetID'] as String?,
  )
    ..subsemantic = json['subsemantic'] as String?
    ..constraints = json['constraints'] == null
        ? null
        : PBIntermediateConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>)
    ..layoutMainAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
    ..layoutCrossAxisSizing = _$enumDecodeNullable(
        _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
    ..auxiliaryData = json['style'] == null
        ? null
        : IntermediateAuxiliaryData.fromJson(
            json['style'] as Map<String, dynamic>)
    ..type = json['type'] as String?;
}

Map<String, dynamic> _$PBSharedInstanceIntermediateNodeToJson(
        PBSharedInstanceIntermediateNode instance) =>
    <String, dynamic>{
      'subsemantic': instance.subsemantic,
      'UUID': instance.UUID,
      'constraints': instance.constraints?.toJson(),
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'boundaryRectangle': Rectangle3D.toJson(instance.frame!),
      'style': instance.auxiliaryData?.toJson(),
      'name': instance.name,
      'symbolID': instance.SYMBOL_ID,
      'overrideValues':
          instance.sharedParamValues?.map((e) => e?.toJson()).toList(),
      'prototypeNodeUUID': instance.prototypeNode?.toJson(),
      'type': instance.type,
      'sharedNodeSetID': instance.sharedNodeSetID,
    };

T? _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhereOrNull((e) => e.value == source)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T? _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};

PBInstanceOverride _$PBInstanceOverrideFromJson(Map<String, dynamic> json) {
  return PBInstanceOverride(
    json['ovrType'] as String?,
    json['value'] as Map<String, dynamic>?,
    json['UUID'] as String?,
    json['name'] as String?,
    json['valueName'] as String?,
  );
}

Map<String, dynamic> _$PBInstanceOverrideToJson(PBInstanceOverride instance) =>
    <String, dynamic>{
      'ovrType': instance.ovrType,
      'value': instance.initialValue,
      'UUID': instance.UUID,
      'name': instance.overrideName,
      'valueName': instance.valueName,
    };
