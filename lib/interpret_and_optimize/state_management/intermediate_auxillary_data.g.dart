// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intermediate_auxillary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntermediateAuxiliaryData _$IntermediateAuxiliaryDataFromJson(
        Map<String, dynamic> json) =>
    IntermediateAuxiliaryData(
      colors: (json['fills'] as List<dynamic>?)
          ?.map((e) => PBFill.fromJson(e as Map<String, dynamic>))
          .toList(),
      borderInfo: json['borderOptions'] == null
          ? null
          : IntermediateBorderInfo.fromJson(
              json['borderOptions'] as Map<String, dynamic>),
      effects: (json['effects'] as List<dynamic>?)
          ?.map((e) => PBEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      intermediateTextStyle: json['textStyle'] == null
          ? null
          : PBTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
      clipsContent: json['clipsContent'] as bool? ?? false,
    )..alignment = json['alignment'] as Map<String, dynamic>?;

Map<String, dynamic> _$IntermediateAuxiliaryDataToJson(
        IntermediateAuxiliaryData instance) =>
    <String, dynamic>{
      'alignment': instance.alignment,
      'fills': instance.colors?.map((e) => e.toJson()).toList(),
      'borderOptions': instance.borderInfo?.toJson(),
      'effects': instance.effects?.map((e) => e.toJson()).toList(),
      'textStyle': instance.intermediateTextStyle?.toJson(),
      'clipsContent': instance.clipsContent,
    };
