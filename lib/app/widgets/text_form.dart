import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm({
    super.key,
    required this.labelText,
    required this.type,
    required this.icon,
    required this.controller,
    required this.padding,
    this.iconButton,
    this.validator,
  });
  final String labelText;
  final TextInputType type;
  final Icon icon;
  final TextEditingController controller;
  final EdgeInsets padding;
  final Widget? iconButton;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        style: context.textTheme.labelLarge,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: iconButton,
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
