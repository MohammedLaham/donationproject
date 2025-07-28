import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.btn_height = 48,
    required this.onTap,
    required this.text,
    this.textFontSize = 14,
    this.icon,
  });

  final double btn_height;
  final String text;
  final Widget? icon;
  final double textFontSize;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        minimumSize: WidgetStatePropertyAll<Size>(
          Size(double.infinity, btn_height),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(greenColor),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          horizontalSpacing(8),
          Text(
            text,
            style: font16BlackBold.copyWith(
              color: Colors.white,
              fontSize: textFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
