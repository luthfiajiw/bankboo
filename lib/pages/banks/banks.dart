import 'package:bankboo/shared/models/page_context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banks.g.dart';

@JsonSerializable()
class Banks {
  String message;
  @JsonKey(name: 'status_code')
  int statusCode;
  Data data;

  Banks({
    this.message,
    this.statusCode,
    this.data
  });

  factory Banks.fromJson(Map<String, dynamic> parsedJson) => _$BanksFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$BanksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  int count;
  @JsonKey(name: 'page_context')
  PageContext pageContext;
  List<Bank> results;

  Data({
    this.count,
    // this.pageContext,
    this.results
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) => _$DataFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Bank {
  String id;
  int code;
  String name;
  String email;
  @JsonKey(name: 'image_url')
  String imageUrl;
  String phone;
  String address;
  @JsonKey(name: 'last_login')
  String lastLogin;
  String createdAt;
  String updatedAt;

  Bank({
    this.id,
    this.code,
    this.name,
    this.email,
    this.imageUrl,
    this.phone,
    this.address,
    this.lastLogin,
    this.createdAt,
    this.updatedAt
  });

  factory Bank.fromJson(Map<String, dynamic> parsedJson) => _$BankFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}