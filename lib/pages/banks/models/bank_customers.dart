import 'package:bankboo/pages/banks/models/banks.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:bankboo/shared/models/customer.dart';
import 'package:bankboo/shared/models/page_context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_customers.g.dart';

@JsonSerializable()
class BankCustomers {
  String message;
  @JsonKey(name: 'status_code')
  int statusCode;
  Data data;

  BankCustomers({
    this.message,
    this.statusCode,
    this.data
  });

  factory BankCustomers.fromJson(Map<String, dynamic> parsedJson) => _$BankCustomersFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$BankCustomersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  int count;
  @JsonKey(name: 'page_context')
  PageContext pageContext;
  List<BankCustomer> results;

  Data({
    int count,
    PageContext pageContext,
    List<Bank> results
  }) :
  count = count ?? 0,
  pageContext = pageContext ?? PageContext(),
  results = results ?? <BankCustomer>[];

  factory Data.fromJson(Map<String, dynamic> parsedJson) => _$DataFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BankCustomer {
  String id;
  String status;
  @JsonKey(name: 'registered_at')
  String registeredAt;
  Customer user;
  Bank bank;
  SavingBook savingBook;
  Relationships relationships;

  BankCustomer({
    this.id,
    this.status,
    this.registeredAt,
    this.user,
    this.bank,
    this.savingBook,
    this.relationships
  });

  factory BankCustomer.fromJson(Map<String, dynamic> parsedJson) => _$BankCustomerFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$BankCustomerToJson(this);
}