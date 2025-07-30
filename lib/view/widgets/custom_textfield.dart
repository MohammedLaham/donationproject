
import 'package:flutter/material.dart';
import '../../core/color/constant.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final Color backgroundColor;
  final Color textColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double vertical;
  final double horizantal;
  final IconData? prefixIcons;
  final bool isDateField;

  const CustomTextField({
    super.key,
    required this.label,
    this.prefixIcons,
    this.hintText,
    this.controller,
    this.isDateField = false,
    this.isPassword = false,
    this.backgroundColor = const Color(0xFFE5F5F0),
    this.textColor = primaryColor,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.vertical = 0,
    this.horizantal = 0,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      widget.controller?.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = RegExp(r'^[\u0600-\u06FF]').hasMatch(widget.hintText ?? widget.label);

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: TextStyle(color: widget.textColor),
      textAlign: isArabic ? TextAlign.right : TextAlign.left,
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      readOnly: widget.isDateField,
      onTap: widget.isDateField
          ? () => _selectDate(context)
          : null,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcons != null
            ? Icon(widget.prefixIcons, color: widget.textColor)
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: widget.textColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.vertical,
          horizontal: widget.horizantal,
        ),
        labelText: widget.hintText ?? widget.label,
        hintText: widget.controller?.text.isEmpty == true ? widget.hintText : null,
        // labelText: widget.label,
        labelStyle: TextStyle(color: widget.textColor),
        // hintText: widget.hintText,
        hintStyle: TextStyle(color: const Color(0xFF009963)),
        filled: true,
        fillColor: widget.backgroundColor,
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

// import 'package:flutter/material.dart';
//
// import '../../core/color/constant.dart';
//
//
// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String? hintText;
//   final TextEditingController? controller;
//    final bool obscureText;
//   final Color backgroundColor;
//   final Color textColor;
//   final TextInputType keyboardType;
//   final String? Function(String?)? validator;
//   final double vertical;
//   final double horizantal;
//   final IconData? prefixIcons;
//   final bool isPassword;
//
//   const CustomTextField({
//     super.key,
//     required this.label,
//     this.prefixIcons,
//     this.hintText,
//     this.controller,
//     this.isPassword = false,
//     this.obscureText = false,
//     this.backgroundColor = const Color(0xFFE5F5F0),
//     this.textColor = primaryColor,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//     this.vertical = 0,
//     this.horizantal = 0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     bool isArabic = RegExp(r'^[\u0600-\u06FF]').hasMatch(hintText ?? label);
//
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       validator: validator,
//       style: TextStyle(color: textColor),
//       textAlign: isArabic ? TextAlign.right : TextAlign.left,
//       textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
//       decoration: InputDecoration(
//
//         prefixIcon: prefixIcons != null
//             ? Icon(prefixIcons, color: textColor)
//             : null,
//         suffixIcon: isPassword ? IconButton(
//             icon: Icon(
//               obscureText ? Icons.visibility_off : Icons.visibility,
//               color: textColor,
//             ),
//             onPressed: () {
//           setState(() {
//             obscureText = !obscureText;
//           });
//         },):null,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: vertical,
//           horizontal: horizantal,
//         ),
//
//         // ← هذا يكبّر المربع
//         labelText: label,
//         labelStyle: TextStyle(color: textColor,),
//         hintText: hintText,
//         hintStyle: TextStyle(color: Color(0xFF009963)),
//         // أخضر غامق
//         filled: true,
//         fillColor: backgroundColor,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
