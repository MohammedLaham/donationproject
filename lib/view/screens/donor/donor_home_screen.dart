import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_card.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';

class DonorHomeScreen extends StatefulWidget {
  const DonorHomeScreen({super.key});

  @override
  State<DonorHomeScreen> createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom AppBar
        CustomAppBar(
          leading: Row(
            children: [
              // الشخص
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 22.5,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              horizontalSpacing(8),
              Text('مرحباً بك', style: font20WhiteBold),
            ],
          ),
          actions: [
            // أيقونة االشات
            GestureDetector(
              child: SvgPicture.asset('assets/svgs/message.svg'),
              onTap: () {},
            ),
            horizontalSpacing(16),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  child: SvgPicture.asset('assets/svgs/notification.svg'),
                  onTap: () {},
                ),
                PositionedDirectional(
                  end: -10.w,
                  top: -15.h,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Text(
                      '4',
                      style: font14BlackMedium.copyWith(color: primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search and filter
              CustomTextField(
                horizantal: 10.w,
                hintText: 'ابحث ...',
                prefixIcons: Icons.search,
                textColor: mainGray,
                label: '',
                backgroundColor: lightGray,
                controller: _searchController,
              ),
              verticalSpacing(16.h),
              Text('قائمة الأيتام', style: font20BlackBold),
              verticalSpacing(16.h),
              // orphan list
              Card(
                shadowColor: Color(0xFF129412),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('أحمد ياسر', style: font16BlackBold),
                          Spacer(),
                          Text('9 سنوات', style: font12BlackMedium),
                        ],
                      ),
                      verticalSpacing(9.h),
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          horizontalSpacing(4.w),
                          Text('يعاني من إعاقة', style: font12BlackMedium),
                          Spacer(),
                          SvgPicture.asset('assets/svgs/ic_donation.svg'),

                          horizontalSpacing(6.w),
                          Text('آخر تبرع منذ 2 يوم', style: font12BlackMedium),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 22.5,
                    child: Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  onTap: () {
                    //TODO: Implement orphan details navigation
                  },
                  contentPadding: EdgeInsetsDirectional.all(16.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
  // Row(
  //                       children: [
  //                         SvgPicture.asset('assets/svgs/ic_donation.svg'),

  //                         horizontalSpacing(6.w),
  //                         Flexible(
  //                           child: Text(
  //                             'آخر تبرع منذ 2 يوم',
  //                             style: font12BlackMedium,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
                 

//  ColoredBox(
//             color: primaryColor,
//             child: Padding(
//               padding: EdgeInsetsDirectional.symmetric(
//                 vertical: 8,
//                 horizontal: 16,
//               ),
//               child: Row(
//                 children: [
//                   // الشخص
//                   CircleAvatar(
//                     backgroundColor: Colors.grey[300],
//                     radius: 22.5,
//                     child: Icon(Icons.person, color: Colors.white, size: 32),
//                   ),
//                   horizontalSpacing(8),
//                   Text('مرحباً بك', style: font20WhiteBold),
//                   Spacer(),
//                   // أيقونة االشات
//                   GestureDetector(
//                     child: SvgPicture.asset('assets/svgs/message.svg'),
//                     onTap: () {},
//                   ),
//                   horizontalSpacing(16),
//                   Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       GestureDetector(
//                         child: SvgPicture.asset('assets/svgs/notification.svg'),
//                         onTap: () {},
//                       ),
//                       PositionedDirectional(
//                         end: -10,
//                         top: -15,
//                         child: Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           constraints: const BoxConstraints(
//                             minWidth: 16,
//                             minHeight: 16,
//                           ),
//                           child: Text(
//                             '4',
//                             style: font14BlackMedium.copyWith(
//                               color: primaryColor,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
          

          // trailing: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Icon(Icons.monetization_on, color: primaryColor),
          //                 horizontalSpacing(4.w),
          //                 Text('آخر تبرع منذ 2 يوم', style: font12BlackMedium),
          //               ],
          //             ),
          //           ],
          //         ),