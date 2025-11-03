import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const NumberInputField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
