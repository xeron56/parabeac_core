// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutProperties _$LayoutPropertiesFromJson(Map<String, dynamic> json) =>
    LayoutProperties(
      spacing: json['spacing'] as num?,
      leftPadding: json['leftPadding'] as num?,
      rightPadding: json['rightPadding'] as num?,
      topPadding: json['topPadding'] as num?,
      bottomPadding: json['bottomPadding'] as num?,
      crossAxisAlignment: $enumDecodeNullable(
          _$IntermediateAxisAlignmentEnumMap, json['counterAxisAlignment']),
      primaryAxisAlignment: $enumDecodeNullable(
          _$IntermediateAxisAlignmentEnumMap, json['primaryAxisAlignment']),
      crossAxisSizing: $enumDecodeNullable(
          _$IntermediateAxisModeEnumMap, json['counterAxisSizing']),
      primaryAxisSizing: $enumDecodeNullable(
          _$IntermediateAxisModeEnumMap, json['primaryAxisSizing']),
    );

Map<String, dynamic> _$LayoutPropertiesToJson(LayoutProperties instance) =>
    <String, dynamic>{
      'spacing': instance.spacing,
      'leftPadding': instance.leftPadding,
      'rightPadding': instance.rightPadding,
      'topPadding': instance.topPadding,
      'bottomPadding': instance.bottomPadding,
      'primaryAxisAlignment':
          _$IntermediateAxisAlignmentEnumMap[instance.primaryAxisAlignment],
      'counterAxisAlignment':
          _$IntermediateAxisAlignmentEnumMap[instance.crossAxisAlignment],
      'primaryAxisSizing':
          _$IntermediateAxisModeEnumMap[instance.primaryAxisSizing],
      'counterAxisSizing':
          _$IntermediateAxisModeEnumMap[instance.crossAxisSizing],
    };

const _$IntermediateAxisAlignmentEnumMap = {
  IntermediateAxisAlignment.START: 'START',
  IntermediateAxisAlignment.CENTER: 'CENTER',
  IntermediateAxisAlignment.END: 'END',
  IntermediateAxisAlignment.SPACE_BETWEEN: 'SPACE_BETWEEN',
};

const _$IntermediateAxisModeEnumMap = {
  IntermediateAxisMode.FIXED: 'FIXED',
  IntermediateAxisMode.HUGGED: 'HUGGED',
};
