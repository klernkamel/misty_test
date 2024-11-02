import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  final String? selectedCurrency;
  final VoidCallback onTap;

  const CurrencySelector({
    super.key,
    required this.selectedCurrency,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        ),
        child: Row(
          children: [
            Text(selectedCurrency ?? 'Select'),
            const Spacer(),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
