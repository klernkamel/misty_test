// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyStore on _CurrencyStore, Store {
  late final _$exchangeRatesAtom =
      Atom(name: '_CurrencyStore.exchangeRates', context: context);

  @override
  ObservableList<ExchangeRate> get exchangeRates {
    _$exchangeRatesAtom.reportRead();
    return super.exchangeRates;
  }

  @override
  set exchangeRates(ObservableList<ExchangeRate> value) {
    _$exchangeRatesAtom.reportWrite(value, super.exchangeRates, () {
      super.exchangeRates = value;
    });
  }

  late final _$currenciesAtom =
      Atom(name: '_CurrencyStore.currencies', context: context);

  @override
  ObservableList<String> get currencies {
    _$currenciesAtom.reportRead();
    return super.currencies;
  }

  @override
  set currencies(ObservableList<String> value) {
    _$currenciesAtom.reportWrite(value, super.currencies, () {
      super.currencies = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CurrencyStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CurrencyStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadExchangeRatesAsyncAction =
      AsyncAction('_CurrencyStore.loadExchangeRates', context: context);

  @override
  Future<void> loadExchangeRates() {
    return _$loadExchangeRatesAsyncAction.run(() => super.loadExchangeRates());
  }

  late final _$_CurrencyStoreActionController =
      ActionController(name: '_CurrencyStore', context: context);

  @override
  double convertCurrency(
      String fromCurrency, String toCurrency, double amount) {
    final _$actionInfo = _$_CurrencyStoreActionController.startAction(
        name: '_CurrencyStore.convertCurrency');
    try {
      return super.convertCurrency(fromCurrency, toCurrency, amount);
    } finally {
      _$_CurrencyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exchangeRates: ${exchangeRates},
currencies: ${currencies},
errorMessage: ${errorMessage},
isLoading: ${isLoading}
    ''';
  }
}
