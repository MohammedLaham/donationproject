import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final TextStyle hintTextStyle;
  final double horizantal;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.hintTextStyle = const TextStyle(color: Color(0xFF009963)),
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.backgroundColor = const Color(0xFFE5F5F0),
    this.textColor = primaryColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.vertical = 0,
    this.horizantal = 0,
    this.borderRadius = 20,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: mainGray,
      keyboardType: keyboardType,
      validator: validator,

      // ← هذه تتحكم بالمسافة بين الأيقونة والنص
      style: TextStyle(
        color: textColor,
        fontFamily: 'Cairo',
        fontSize: 14.sp,
        fontWeight: FontWeightHeper.normal,
      ),
      decoration: InputDecoration(
        suffixIcon: obscureText != null ? suffixIcon : SizedBox(),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: prefixIcon,
              )
            : SizedBox(),
        prefixIconColor: mainGray,

        prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
        contentPadding: EdgeInsetsDirectional.symmetric(
          vertical: vertical,
          horizontal: horizantal,
        ),
        // ← هذا يكبّر المربع
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        hintText: hintText,
        hintStyle: hintTextStyle,
        // أخضر غامق
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
