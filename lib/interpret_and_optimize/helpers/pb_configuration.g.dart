// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBConfiguration _$PBConfigurationFromJson(Map<String, dynamic> json) =>
    PBConfiguration(
      json['scaling'] as bool? ?? true,
      json['breakpoints'] as Map<String, dynamic>?,
      figmaOauthToken: json['oauth'] as String?,
      figmaKey: json['figKey'] as String?,
      figmaProjectID: json['fig'] as String?,
      projectName: json['project-name'] as String? ?? 'foo',
      outputPath: json['out'] as String?,
      pbdlPath: json['pbdl-in'] as String?,
      exportPBDL: json['export-pbdl'] as bool? ?? false,
      folderArchitecture: json['folderArchitecture'] as String? ?? 'domain',
      componentIsolation: json['componentIsolation'] as String? ?? 'None',
      integrationLevel: $enumDecodeNullable(
              _$IntegrationLevelEnumMap, json['project-type']) ??
          IntegrationLevel.screens,
    )..designSystem = json['designSystem'] as String? ?? 'material3';

Map<String, dynamic> _$PBConfigurationToJson(PBConfiguration instance) =>
    <String, dynamic>{
      'oauth': instance.figmaOauthToken,
      'figKey': instance.figmaKey,
      'fig': instance.figmaProjectID,
      'project-name': instance.projectName,
      'out': instance.outputPath,
      'pbdl-in': instance.pbdlPath,
      'export-pbdl': instance.exportPBDL,
      'designSystem': instance.designSystem,
      'folderArchitecture': instance.folderArchitecture,
      'scaling': instance.scaling,
      'breakpoints': instance.breakpoints,
      'componentIsolation': instance.componentIsolation,
      'project-type': _$IntegrationLevelEnumMap[instance.integrationLevel],
    };

const _$IntegrationLevelEnumMap = {
  IntegrationLevel.themes: 'themes',
  IntegrationLevel.components: 'components',
  IntegrationLevel.screens: 'screens',
};
