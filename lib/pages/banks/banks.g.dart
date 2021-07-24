// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banks _$BanksFromJson(Map<String, dynamic> json) {
  return Banks(
    message: json['message'] as String,
    statusCode: json['status_code'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BanksToJson(Banks instance) => <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    count: json['count'] as int,
    pageContext: json['page_context'] == null
        ? null
        : PageContext.fromJson(json['page_context'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'count': instance.count,
      'page_context': instance.pageContext?.toJson(),
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
    id: json['id'] as String,
    code: json['code'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    imageUrl: json['image_url'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    lastLogin: json['last_login'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    relationships: json['relationships'] == null
        ? null
        : Relationships.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'image_url': instance.imageUrl,
      'phone': instance.phone,
      'address': instance.address,
      'last_login': instance.lastLogin,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'relationships': instance.relationships?.toJson(),
    };

Relationships _$RelationshipsFromJson(Map<String, dynamic> json) {
  return Relationships(
    registeredAsCustomer: json['registered_as_customer'] as bool,
  );
}

Map<String, dynamic> _$RelationshipsToJson(Relationships instance) =>
    <String, dynamic>{
      'registered_as_customer': instance.registeredAsCustomer,
    };
