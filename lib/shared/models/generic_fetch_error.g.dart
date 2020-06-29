// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_fetch_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericFetchError _$GenericFetchErrorFromJson(Map<String, dynamic> json) {
  return GenericFetchError(
    error: json['error'] == null
        ? null
        : GenericError.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenericFetchErrorToJson(GenericFetchError instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

GenericError _$GenericErrorFromJson(Map<String, dynamic> json) {
  return GenericError(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$GenericErrorToJson(GenericError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
