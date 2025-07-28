import 'package:donationproject/constant.dart';
import 'package:donationproject/core/routing/routes.dart';
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

  List orphanList = [
    ['أحمد سعيد', 3, 2, false],
    ['أحمد ياسر', 9, 30, true],
    ['علي محمد', 5, 10, false],
    ['سارة علي', 7, 15, true],
    ['مريم أحمد', 4, 5, false],
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
                        name: orphanList[index][0],
                        age: orphanList[index][1],
                        lastDonation: orphanList[index][2],
                        isdisable: orphanList[index][3],
                        onTap: () {
                          //TODO: send orphan info
                          Navigator.pushNamed(context, Routes.orphanInfoScreen);
                        },
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}