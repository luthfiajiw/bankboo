// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingBooks _$SavingBooksFromJson(Map<String, dynamic> json) {
  return SavingBooks(
    message: json['message'] as String,
    statusCode: json['status_code'] as int,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SavingBooksToJson(SavingBooks instance) =>
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
        ?.map((e) =>
            e == null ? null : SavingBook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'count': instance.count,
      'page_context': instance.pageContext?.toJson(),
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

SavingBook _$SavingBookFromJson(Map<String, dynamic> json) {
  return SavingBook(
    id: json['id'] as String,
    number: json['number'] as int,
    balance: json['balance'] as int,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    customer: json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    bank: json['bank'] == null
        ? null
        : Bank.fromJson(json['bank'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SavingBookToJson(SavingBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'balance': instance.balance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'customer': instance.customer?.toJson(),
      'bank': instance.bank?.toJson(),
    };
