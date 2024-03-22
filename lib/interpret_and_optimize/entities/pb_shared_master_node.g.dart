// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_shared_master_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBSharedMasterNode _$PBSharedMasterNodeFromJson(Map<String, dynamic> json) =>
    PBSharedMasterNode(
      json['UUID'] as String?,
      Rectangle3D.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
      SYMBOL_ID: json['symbolID'] as String?,
      name: json['name'] as String?,
      prototypeNode: PrototypeNode.prototypeNodeFromJson(
          json['prototypeNodeUUID'] as String?),
      constraints: json['constraints'] == null
          ? null
          : PBIntermediateConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>),
      componentSetName: json['componentSetName'] as String?,
      sharedNodeSetID: json['sharedNodeSetID'] as String?,
    )
      ..layoutMainAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutMainAxisSizing'])
      ..layoutCrossAxisSizing = $enumDecodeNullable(
          _$ParentLayoutSizingEnumMap, json['layoutCrossAxisSizing'])
      ..auxiliaryData = json['style'] == null
          ? null
          : IntermediateAuxiliaryData.fromJson(
              json['style'] as Map<String, dynamic>)
      ..type = json['type'] as String?;

Map<String, dynamic> _$PBSharedMasterNodeToJson(PBSharedMasterNode instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'constraints': instance.constraints?.toJson(),
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'boundaryRectangle': Rectangle3D.toJson(instance.frame),
      'style': instance.auxiliaryData?.toJson(),
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNode?.toJson(),
      'symbolID': instance.SYMBOL_ID,
      'type': instance.type,
      'componentSetName': instance.componentSetName,
      'sharedNodeSetID': instance.sharedNodeSetID,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};

PBMasterOverride _$PBMasterOverrideFromJson(Map<String, dynamic> json) =>
    PBMasterOverride(
      json['ovrType'] as String?,
      PBMasterOverride._propertyNameFromJson(json['name'] as String),
      json['UUID'] as String?,
    );

Map<String, dynamic> _$PBMasterOverrideToJson(PBMasterOverride instance) =>
    <String, dynamic>{
      'ovrType': instance.ovrType,
      'name': instance.propertyName,
      'UUID': instance.UUID,
    };
