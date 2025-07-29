import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrphanCard extends StatelessWidget {
  final String name;
  final int age;
  final int lastDonation;
  final bool isdisable;
  final void Function() onTap;

  const OrphanCard({
    Key? key,
    required this.name,
    required this.age,
    required this.lastDonation,
    required this.isdisable,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightGray,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF129412).withAlpha(102),
            blurRadius: 3,
            spreadRadius: 0.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(name, style: font16BlackBold),
                Spacer(),
                Text('$age سنوات', style: font12BlackMedium),
              ],
            ),
            verticalSpacing(9.h),
            Row(
              children: [
                isdisable
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : Material(
                        color: Colors.red,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16
                          ),
                        ),
                      ),

                horizontalSpacing(4.w),
                Text(
                  isdisable ? 'يعاني من إعاقة' : 'لا يعاني من إعاقة',
                  style: font12BlackMedium,
                ),
                Spacer(),
                SvgPicture.asset('assets/svgs/ic_donation.svg'),

                horizontalSpacing(6.w),
                Text(
                  'آخر تبرع منذ $lastDonation يوم',
                  style: font12BlackMedium,
                ),
              ],
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 22.5,
          child: Icon(Icons.person, color: Colors.white, size: 32),
        ),
        onTap: onTap,
        contentPadding: EdgeInsetsDirectional.all(16.0),
      ),
    );

    //  Card(
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Icon(icon, color: Colors.green),
    //             SizedBox(width: 8),
    //             Text(
    //               title,
    //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //             ),
    //             Spacer(),
    //             if (isCheck) Icon(Icons.check_circle, color: Colors.green),
    //           ],
    //         ),
    //         SizedBox(height: 8),
    //         Text(subtitle, style: TextStyle(fontSize: 16)),
    //         if (additionalInfo.isNotEmpty) ...[
    //           SizedBox(height: 4),
    //           Text(additionalInfo, style: TextStyle(color: Colors.grey)),
    //         ],
    //         if (buttonText != null) ...[
    //           SizedBox(height: 16),
    //           ElevatedButton(
    //             onPressed: () {
    //               // يمكنك إضافة الوظيفة هنا
    //             },
    //             child: Text(buttonText!),
    //           ),
    //         ],
    //       ],
    //     ),
    //   ),
    // );
  }
}
