import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Color backgroundColor;
  final Color textColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double vertical;
  final double horizantal;
  final IconData? prefixIcons;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcons,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.backgroundColor = const Color(0xFFE5F5F0),
    this.textColor = primaryColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.vertical = 0,
    this.horizantal = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcons != null
            ? Icon(prefixIcons, color: textColor)
            : null,
        
        contentPadding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizantal,
        ),

        // ← هذا يكبّر المربع
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF009963)),
        // أخضر غامق
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
