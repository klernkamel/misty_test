import 'package:flutter/material.dart';

class CurrencyPickerDialog extends StatefulWidget {
  final String title;
  final List<String> currencies;
  final String? selectedCurrency;
  final ValueChanged<String> onCurrencySelected;

  const CurrencyPickerDialog({
    super.key,
    required this.title,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencySelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyPickerDialogState createState() => _CurrencyPickerDialogState();
}

class _CurrencyPickerDialogState extends State<CurrencyPickerDialog> {
  String? tempSelectedCurrency;

  @override
  void initState() {
    super.initState();
    tempSelectedCurrency = widget.selectedCurrency;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.currencies.map((currency) {
            return RadioListTile<String>(
              title: Text(currency),
              value: currency,
              groupValue: tempSelectedCurrency,
              onChanged: (value) {
                setState(() {
                  tempSelectedCurrency = value;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Закрываем диалог без изменений
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (tempSelectedCurrency != null) {
              widget.onCurrencySelected(tempSelectedCurrency!);
            }
            Navigator.of(context).pop(); // Закрываем диалог
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}