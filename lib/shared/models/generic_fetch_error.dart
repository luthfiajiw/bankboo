import 'package:json_annotation/json_annotation.dart';

part 'generic_fetch_error.g.dart';

@JsonSerializable()
class GenericFetchError {
  GenericError error;

  GenericFetchError({this.error});

  factory GenericFetchError.fromJson(Map<String, dynamic> parsedJson) => _$GenericFetchErrorFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$GenericFetchErrorToJson(this);
}

@JsonSerializable()
class GenericError {
  @JsonKey(name: 'statusCode')
  int statusCode;
  String message;

  GenericError({this.statusCode, this.message});

  factory GenericError.fromJson(Map<String, dynamic> parsedJson) => _$GenericErrorFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$GenericErrorToJson(this);
}
