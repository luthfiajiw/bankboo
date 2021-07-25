// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_customers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCustomers _$BankCustomersFromJson(Map<String, dynamic> json) {
  return BankCustomers(
    message: json['message'] as String,
    statusCode: json['status_code'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BankCustomersToJson(BankCustomers instance) =>
    <String, dynamic>{
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

BankCustomer _$BankCustomerFromJson(Map<String, dynamic> json) {
  return BankCustomer(
    id: json['id'] as String,
    status: json['status'] as String,
    registeredAt: json['registered_at'] as String,
    user: json['user'] == null
        ? null
        : Customer.fromJson(json['user'] as Map<String, dynamic>),
    bank: json['bank'] == null
        ? null
        : Bank.fromJson(json['bank'] as Map<String, dynamic>),
    savingBook: json['savingBook'] == null
        ? null
        : SavingBook.fromJson(json['savingBook'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BankCustomerToJson(BankCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'registered_at': instance.registeredAt,
      'user': instance.user?.toJson(),
      'bank': instance.bank?.toJson(),
      'savingBook': instance.savingBook?.toJson(),
    };
