import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? headerText;
  final TextEditingController controller;
  final bool obscureText;
  final OutlineInputBorder? border;

  CustomTextField({
    required this.label,
    required this.controller,
    this.headerText,
    this.obscureText = false,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              headerText!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: label,
            border: border ??  OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.blueAccent),
    ),
          ),
        ),
      ],
    );
  }
}
