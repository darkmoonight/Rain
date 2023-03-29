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
    this.onChanged,
    this.validator,
  });
  final String labelText;
  final TextInputType type;
  final Icon icon;
  final TextEditingController controller;
  final EdgeInsets padding;
  final Widget? iconButton;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: type,
        style: context.theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: iconButton,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: context.theme.disabledColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: context.theme.disabledColor,
            ),
          ),
          labelText: labelText,
        ),
        autofocus: false,
        validator: validator,
      ),
    );
  }
}
