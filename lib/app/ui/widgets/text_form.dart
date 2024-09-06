import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextForm extends StatelessWidget {
  const MyTextForm({
    super.key,
    required this.labelText,
    required this.type,
    required this.icon,
    required this.controller,
    required this.margin,
    this.iconButton,
    this.validator,
    this.elevation,
    this.focusNode,
    this.onChanged,
  });
  final String labelText;
  final TextInputType type;
  final Icon icon;
  final TextEditingController controller;
  final EdgeInsets margin;
  final Widget? iconButton;
  final String? Function(String?)? validator;
  final double? elevation;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: margin,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: type,
        style: context.textTheme.labelLarge,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.5,
            vertical: 0,
          ),
          prefixIcon: icon,
          suffixIcon: iconButton,
          labelText: labelText,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
