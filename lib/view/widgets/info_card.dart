import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class infoCard extends StatelessWidget {
  const infoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    this.onTap,
    this.trailingIcon,
  });
  final String title;
  final String subtitle;
  final Widget leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightGray,
        boxShadow: [
          BoxShadow(color: greenColor, blurRadius: 3, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  leadingIcon,
                  horizontalSpacing(8),
                  Text(title, style: font16BlackBold),
                ],
              ),
              verticalSpacing(8.h),
              Text(
                subtitle,
                style: font14BlackMedium.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
            child: trailingIcon ?? SizedBox(),
            onTap: onTap ?? () {},
          ),
        ],
      ),
    );
  }
}
