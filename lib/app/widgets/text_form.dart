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
  });
  final String labelText;
  final TextInputType type;
  final Icon icon;
  final TextEditingController controller;
  final EdgeInsets padding;
  final Widget? iconButton;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: type,
        style: context.theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: iconButton,
          filled: true,
          fillColor: context.theme.colorScheme.secondary,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          labelText: labelText,
        ),
        autofocus: false,
      ),
    );
  }
}