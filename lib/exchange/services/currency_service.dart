import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:misty_test_task/exchange/models/exchange_rate.dart';

@lazySingleton
class CurrencyService {
  final Dio _dio;
  final Isar _isar;

  CurrencyService(this._dio, this._isar);

  Future<List<ExchangeRate>> fetchExchangeRates() async {
    try {
      final response =
          await _dio.get('https://api.exchangerate-api.com/v4/latest/USD');

      final rates = response.data['rates'] as Map<String, dynamic>;

      final exchangeRates = rates.entries.map((entry) {
        return ExchangeRate()
          ..currency = entry.key
          ..rate = entry.value.toDouble();
      }).toList();

      await _isar.writeTxn(() async {
        await _isar.exchangeRates.clear();
        await _isar.exchangeRates.putAll(exchangeRates);
      });

      return exchangeRates;
    } catch (e) {
      // print('Error: $e');
      return await _isar.exchangeRates.where().findAll();
    }
  }
}
