import 'package:donationproject/constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.leading, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double appBarHeight =
        screenHeight * 0.138; // نسبة 13.8% من ارتفاع الشاشة

    return Container(
      color: primaryColor, // الأخضر
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16, // padding مناسب للشاشات الصغيرة
      ),
      height: appBarHeight,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              //isRtl
              [
                leading ?? const SizedBox(),
                Expanded(
                  child: Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: title ?? const SizedBox(),
                    ),
                  ),
                ),
                Row(mainAxisSize: MainAxisSize.min, children: actions ?? []),
              ],
          // : [
          // Row(mainAxisSize: MainAxisSize.min, children: actions ?? []),
          // Expanded(
          //   child: Center(
          //     child: DefaultTextStyle(
          //       style: TextStyle(
          //         fontSize: screenWidth * 0.045,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //       ),
          //       child: title ?? const SizedBox(),
          //     ),
          //   ),
          // ),
          // leading ?? const SizedBox(),
          //  ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
