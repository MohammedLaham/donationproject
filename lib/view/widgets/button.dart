import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgr,
    required this.color,
    required this.width, required this.borderRadius, this.borderColor,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? backgr;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),side: BorderSide(color: borderColor??Colors.transparent)

          ),
        ),
        child: Text(text, style: TextStyle(color: color,fontFamily: 'Cairo')),
      ),
    );
  }
}
