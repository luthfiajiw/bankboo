import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String id;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String fullname;
  String email;
  @JsonKey(name: 'image_url')
  String imageUrl;
  @JsonKey(name: 'mobile_phone')
  String mobilePhone;
  String address;
  String createdAt;
  String updatedAt;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.fullname,
    this.email,
    this.imageUrl,
    this.mobilePhone,
    this.address,
    this.createdAt,
    this.updatedAt
  });

  factory Customer.fromJson(Map<String, dynamic> parsedJson) => _$CustomerFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}