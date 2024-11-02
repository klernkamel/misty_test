import 'package:flutter/material.dart';

class AmountInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final VoidCallback onChanged;
  final bool? readOnly;

  const AmountInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.readOnly
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: (readOnly == null) ? false : readOnly!,
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) => onChanged(),
    );
  }
}