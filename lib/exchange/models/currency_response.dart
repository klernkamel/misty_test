import 'package:json_annotation/json_annotation.dart';

part 'currency_response.g.dart';

@JsonSerializable()
class CurrencyResponse {
  CurrencyResponse({
    required this.base,
    required this.date,
    required this.rates,
  });

  final String base;
  final String date;
  final Map<String, double> rates;

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}