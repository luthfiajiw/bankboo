// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageContext _$PageContextFromJson(Map<String, dynamic> json) {
  return PageContext(
    page: json['page'] as int,
    perPage: json['perPage'] as int,
    totalPage: json['totalPage'] as int,
  );
}

Map<String, dynamic> _$PageContextToJson(PageContext instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalPage': instance.totalPage,
    };
