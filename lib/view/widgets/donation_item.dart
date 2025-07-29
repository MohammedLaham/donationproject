import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_elevated_button.dart';
import 'custom_outline_button.dart';

class DonationItem extends StatelessWidget {
  const DonationItem({
    super.key,
    required this.orphanName,
    required this.donationDate,
    required this.amount,
    required this.donatiobOnTap,
    required this.chatbOnTap,
  });
  final String orphanName;
  final String donationDate;
  final double amount;
  final VoidCallback donatiobOnTap;
  final VoidCallback chatbOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 16.h),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 22.5,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              horizontalSpacing(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/ic_profile.svg',
                          color: greenColor,
                        ),
                        horizontalSpacing(8),
                        Text(orphanName, style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(12.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/calendar.svg'),
                        horizontalSpacing(8),
                        Text(donationDate, style: font12BlackMedium),
                        Spacer(),
                        SvgPicture.asset('assets/svgs/hand_money.svg'),

                        horizontalSpacing(8),
                        Text(
                          '${amount.toStringAsFixed(2)} شيكل',
                          style: font12BlackMedium,
                        ),
                      ],
                    ),
                    verticalSpacing(16),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onTap: donatiobOnTap,
                  text: 'التبرع مرة أخرى',
                ),
              ),
              horizontalSpacing(18),
              Expanded(
                child: CustomOutlineButton(
                  text: 'مراسلة',
                  onTap: chatbOnTap,
                  icon: SvgPicture.asset(
                    'assets/svgs/message.svg',
                    color: greenColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//  Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               radius: 22.5,
//               child: Icon(Icons.person, color: Colors.white, size: 32),
//             ),
//             horizontalSpacing(8),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/svgs/ic_profile.svg',
//                       color: greenColor,
//                     ),
//                     horizontalSpacing(8),
//                     Text(orphanName, style: font20BlackSemiBold),
//                   ],
//                 ),
//                 verticalSpacing(12.h),
//                 Row(
//                   children: [
//                     Row(
//                       children: [
//                         SvgPicture.asset('assets/svgs/calendar.svg'),
//                         horizontalSpacing(8),
//                         Text(donationDate, style: font12BlackMedium),
//                       ],
//                     ),
//                     Spacer(),
//                     Row(
//                       children: [
//                         SvgPicture.asset('assets/svgs/hand_money.svg'),
//                         horizontalSpacing(8),
//                         Text(
//                           '${amount.toStringAsFixed(2)} شيكل',
//                           style: font12BlackMedium,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: CustomElevatedButton(
//                 onTap: () {
//                   Navigator.pushNamed(context, Routes.confirmDonationScreen);
//                 },
//                 text: 'التبرع مرة أخرى',
//               ),
//             ),
//             horizontalSpacing(18),
//             CustomOutlineButton(
//               text: 'مراسلة',
//               onTap: () {
//                 Navigator.pushNamed(context, Routes.chatScreen);
//               },
//             ),
//           ],
//         ),

// ListTile(
//   title: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         children: [
//           SvgPicture.asset(
//             'assets/svgs/ic_profile.svg',
//             color: greenColor,
//           ),
//           horizontalSpacing(8),
//           Text(orphanName, style: font20BlackSemiBold),
//         ],
//       ),
//       verticalSpacing(9.h),
//       Row(
//         children: [
//           isdisable
//               ? Icon(Icons.check_circle, color: Colors.green)
//               : Material(
//                   color: Colors.red,
//                   shape: CircleBorder(),
//                   child: Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),

//           horizontalSpacing(4.w),
//           Text(
//             isdisable ? 'يعاني من إعاقة' : ' لا يعاني من إعاقة',
//             style: font12BlackMedium,
//           ),
//           Spacer(),
//           SvgPicture.asset('assets/svgs/ic_donation.svg'),

//           horizontalSpacing(6.w),
//           Text(
//             'آخر تبرع منذ $lastDonation يوم',
//             style: font12BlackMedium,
//           ),
//         ],
//       ),
//     ],
//   ),
//   leading: CircleAvatar(
//     backgroundColor: Colors.grey[300],
//     radius: 22.5,
//     child: Icon(Icons.person, color: Colors.white, size: 32),
//   ),
//  subtitle: ,
//   contentPadding: EdgeInsetsDirectional.all(16.0),

// ),
