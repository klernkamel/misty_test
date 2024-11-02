// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) =>
    CurrencyResponse(
      base: json['base'] as String,
      date: json['date'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'base': instance.base,
      'date': instance.date,
      'rates': instance.rates,
    };
