import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate.g.dart';

@JsonSerializable()
@collection
class ExchangeRate {
  ExchangeRate(); // Неименованный конструктор без параметров

  Id id = Isar.autoIncrement;

  late String currency;
  late double rate;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);
}