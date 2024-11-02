import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import '../services/currency_service.dart';
import '../models/exchange_rate.dart';

part 'currency_store.g.dart';

@lazySingleton
// ignore: library_private_types_in_public_api
class CurrencyStore = _CurrencyStore with _$CurrencyStore;

abstract class _CurrencyStore with Store {
  final CurrencyService _service;

  _CurrencyStore(this._service);

  @observable
  ObservableList<ExchangeRate> exchangeRates = ObservableList<ExchangeRate>();

  @observable
  ObservableList<String> currencies = ObservableList<String>();

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @action
  Future<void> loadExchangeRates() async {
    try {
      isLoading = true;
      final rates = await _service.fetchExchangeRates();
      exchangeRates = ObservableList<ExchangeRate>.of(rates);

      // Обновляем список валют
      currencies = ObservableList<String>.of(
        exchangeRates.map((rate) => rate.currency),
      );
    } catch (e) {
      errorMessage = 'Не удалось загрузить данные';
    } finally {
      isLoading = false;
    }
  }

  @action
  double convertCurrency(
      String fromCurrency, String toCurrency, double amount) {
    final fromRate =
        exchangeRates.firstWhere((rate) => rate.currency == fromCurrency).rate;
    final toRate =
        exchangeRates.firstWhere((rate) => rate.currency == toCurrency).rate;
    // print('from rate: $fromRate and to rate: $toRate');

    return (amount * (toRate / fromRate));
  }

  Future<void> monitorConnection() async {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result.last != ConnectivityResult.none) {
        loadExchangeRates();
      }
    });
  }
}
