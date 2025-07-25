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
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<OrphanCard> orphanList = [
    OrphanCard(name: 'أحمد سعيد', age: 3, lastDonation: 2, isdisable: false),
    OrphanCard(name: 'أحمد ياسر', age: 9, lastDonation: 30, isdisable: true),
    OrphanCard(name: 'علي محمد', age: 5, lastDonation: 10, isdisable: false),
    OrphanCard(name: 'سارة علي', age: 7, lastDonation: 15, isdisable: true),
    OrphanCard(name: 'مريم أحمد', age: 4, lastDonation: 5, isdisable: false),
  ];
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
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search and filter
                Row(
                  children: [
                    Expanded(
                      // البحث
                      child: CustomTextField(
                        horizantal: 10.w,
                        hintText: 'ابحث ...',
                        borderRadius: 4,
                        prefixIcons: Icons.search,
                        textColor: mainGray,
                        label: '',
                        backgroundColor: lightGray,
                        controller: _searchController,
                      ),
                    ),
                    //زر الفلتر
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(greenColor),
                        minimumSize: WidgetStateProperty.all(Size(36, 36)),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.all(4),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: SvgPicture.asset('assets/svgs/ic_filter.svg'),
                    ),
                  ],
                ),
                verticalSpacing(16.h),
                Text('قائمة الأيتام', style: font20BlackBold),
                // verticalSpacing(16.h),
                // orphan list
                Expanded(
                  child: ListView.builder(
                    itemCount: orphanList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrphanCard(
                        name: orphanList[index].name,
                        age: orphanList[index].age,
                        lastDonation: orphanList[index].lastDonation,
                        isdisable: orphanList[index].isdisable,
                      );
                    },
                  ),
                ),

                // OrphanCard(
                //   name: 'أحمد ياسر',
                //   age: 9,
                //   lastDonation: 30,
                //   isdisable: true,
                // ),
              ],
            ),
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
