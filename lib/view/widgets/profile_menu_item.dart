import 'package:donationproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: lightGray, // الخلفية الرمادية الفاتحة
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsetsDirectional.zero,
        onTap: onTap,
        leading: Icon(leadingIcon, color: greenColor, size: 24),

        title: Text(title, style: font16BlackBold),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: Color(0xFF292D32),
        ),
      ),
    );
  }
}
