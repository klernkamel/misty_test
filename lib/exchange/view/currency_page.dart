import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:misty_test_task/exchange/view/widgets/amount_input_field.dart';
import 'package:misty_test_task/exchange/view/widgets/currency_picker_dialog.dart';
import 'package:misty_test_task/exchange/view/widgets/currency_selector.dart';
import '../view_model/currency_store.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final CurrencyStore _store = GetIt.instance<CurrencyStore>();

  String? _fromCurrency;
  String? _toCurrency;
  double? amount;
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _store.loadExchangeRates();
    _store.monitorConnection();
    // _fromController.addListener(_onFromFieldChanged);
    // _toController.addListener(_onToFieldChanged);
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _showCurrencyPicker({
    required String title,
    required String? selectedCurrency,
    required ValueChanged<String> onCurrencySelected,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CurrencyPickerDialog(
          title: title,
          currencies: _store.currencies,
          selectedCurrency: selectedCurrency,
          onCurrencySelected: onCurrencySelected,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Конвертер валют'),
        ),
        body: Observer(
          builder: (_) {
            if (_store.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (_store.errorMessage != null) {
              return Center(child: Text(_store.errorMessage!));
            } else if (_store.currencies.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: AmountInputField(
                              controller: _fromController,
                              labelText: 'Input amount to convert',
                              onChanged: () {
                                setState(() {
                                  amount =
                                      double.tryParse(_fromController.text);
                                });
                              })),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          flex: 3,
                          child: CurrencySelector(
                              selectedCurrency: _fromCurrency,
                              onTap: () {
                                _showCurrencyPicker(
                                    title: 'Choose Currency',
                                    selectedCurrency: _fromCurrency,
                                    onCurrencySelected: (val) {
                                      setState(() {
                                        _fromCurrency = val;
                                      });
                                    });
                              }))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      iconSize: 35,
                      onPressed: (_fromController.text.isEmpty ||
                              _fromCurrency == null ||
                              _toCurrency == null ||
                              amount == null)
                          ? null
                          : () {
                              _toController.text = _store
                                  .convertCurrency(
                                      _fromCurrency!, _toCurrency!, amount!)
                                  .toString();
                            },
                      icon: const Icon(Icons.arrow_downward_rounded)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: AmountInputField(
                              readOnly: true,
                              controller: _toController,
                              labelText: 'There will be conv. amount',
                              onChanged: () {})),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          flex: 3,
                          child: CurrencySelector(
                              selectedCurrency: _toCurrency,
                              onTap: () {
                                _showCurrencyPicker(
                                    title: 'Choose Currency',
                                    selectedCurrency: _toCurrency,
                                    onCurrencySelected: (val) {
                                      setState(() {
                                        _toCurrency = val;
                                      });
                                    });
                              }))
                    ],
                  ),
                ]),
              );
            } else {
              return const Center(
                child: Text('Не удалось получить данные конвертации'),
              );
            }
          },
        ),
      ),
    );
  }
}
