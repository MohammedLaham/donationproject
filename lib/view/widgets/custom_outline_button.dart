import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOutlineButton extends StatelessWidget {
  final double btn_height;
  final double textFontSize;
  final String text;
  final Widget icon;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomOutlineButton({
    super.key,
    this.btn_height = 48,
    required this.text,
    required this.onTap,
    this.icon = const SizedBox(),
    this.borderColor = Colors.green,
    this.textColor = greenColor,
    this.backgroundColor = Colors.white,
    this.textFontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: borderColor, width: 1),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
        minimumSize: WidgetStatePropertyAll<Size>(
          Size(double.infinity, btn_height),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          horizontalSpacing(4),
          Text(
            text,
            style: font16BlackBold.copyWith(
              color: textColor,
              fontSize: textFontSize,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
