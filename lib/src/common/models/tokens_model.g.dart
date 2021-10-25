// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => TokensModel(
      access: json['accessToken'] as String?,
      refresh: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$TokensModelToJson(TokensModel instance) =>
    <String, dynamic>{
      'accessToken': instance.access,
      'refreshToken': instance.refresh,
    };
