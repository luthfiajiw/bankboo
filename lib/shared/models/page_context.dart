import 'package:json_annotation/json_annotation.dart';

part 'page_context.g.dart';

@JsonSerializable()
class PageContext {
  int page;
  int perPage;
  int totalPage;

  PageContext({
    this.page,
    this.perPage,
    this.totalPage
  });

  factory PageContext.fromJson(Map<String, dynamic> parsedJson) => _$PageContextFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$PageContextToJson(this);
}