import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOutlineButton extends StatelessWidget {
  final double btn_height;
  final String text;
  final VoidCallback onTap;
  const CustomOutlineButton({
    super.key,
    this.btn_height = 48,
    required this.text,
    required this.onTap,
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
          BorderSide(color: greenColor, width: 1),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        minimumSize: WidgetStatePropertyAll<Size>(Size(double.infinity, 48)),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/message.svg', color: greenColor),
          horizontalSpacing(4),
          Text(
            text,
            style: font16BlackBold.copyWith(color: greenColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
