import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.textInputType});

  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        hintText:hintText,

      ),
    );
  }
}
