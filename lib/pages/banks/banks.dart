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
    int count,
    PageContext pageContext,
    List<Bank> results
  }) :
  count = count ?? 0,
  pageContext = pageContext ?? PageContext(),
  results = results ?? <Bank>[];

  factory Data.fromJson(Map<String, dynamic> parsedJson) => _$DataFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
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
  Relationships relationships;

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
    this.updatedAt,
    this.relationships
  });

  factory Bank.fromJson(Map<String, dynamic> parsedJson) => _$BankFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}

@JsonSerializable()
class Relationships {
  @JsonKey(name: 'registered_as_customer')
  bool registeredAsCustomer;

  Relationships({
    this.registeredAsCustomer
  });

  factory Relationships.fromJson(Map<String, dynamic> parsedJson) => _$RelationshipsFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$RelationshipsToJson(this);
}