import 'package:bankboo/pages/banks/banks.dart';
import 'package:bankboo/shared/models/customer.dart';
import 'package:bankboo/shared/models/page_context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saving_books.g.dart';

@JsonSerializable()
class SavingBooks {
  String message;
  @JsonKey(name: 'status_code')
  int statusCode;
  Data data;

  SavingBooks({
    this.message,
    this.statusCode,
    this.data
  });

  factory SavingBooks.fromJson(Map<String, dynamic> parsedJson) => _$SavingBooksFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$SavingBooksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  int count;
  @JsonKey(name: 'page_context')
  PageContext pageContext;
  List<SavingBook> results;

  Data({
    int count,
    PageContext pageContext,
    List<SavingBook> results
  }) :
  count = count ?? 0,
  pageContext = pageContext ?? PageContext(),
  results = results ?? <SavingBook>[];

  factory Data.fromJson(Map<String, dynamic> parsedJson) => _$DataFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SavingBook {
  String id;
  int number;
  int balance;
  String createdAt;
  String updatedAt;
  Customer customer;
  Bank bank;

  SavingBook({
    this.id,
    this.number,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.bank
  });

  factory SavingBook.fromJson(Map<String, dynamic> parsedJson) => _$SavingBookFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$SavingBookToJson(this);
}