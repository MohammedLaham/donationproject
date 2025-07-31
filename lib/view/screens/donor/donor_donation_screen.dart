import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/screens/donor/orphan_chat_screen.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/donation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/routing/routes.dart';

class DonorDonationScreen extends StatefulWidget {
  const DonorDonationScreen({super.key});

  @override
  State<DonorDonationScreen> createState() => _DonorDonationScreenState();
}

class _DonorDonationScreenState extends State<DonorDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom AppBar
        CustomAppBar(
          leading: GestureDetector(
            child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('سجل تبرعاتك', style: font20WhiteBold),
        ),
        verticalSpacing(8.h),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              children: [
                Text(
                  'شكرًا لعطائك المستمر! 👏',
                  style: font16BlackBold.copyWith(fontSize: 18.sp),
                ),
                verticalSpacing(8),
                Text(
                  textAlign: TextAlign.center,
                  'سجل تبرعاتك السابقة يظهر أدناه، ويمكنك اختيار إعادة التبرع متى شئت.',
                  style: font14BlackRegular,
                ),
                // verticalSpacing(16.h),
                // قائمة تبرعات المتبرع
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DonationItem(
                        orphanName: 'أحمد سعيد',
                        donationDate: '2023-10-01',
                        amount: 100,
                        donatiobOnTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.confirmDonationScreen,
                          );
                        },
                        chatbOnTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrphanChatScreen(orphan: 'أحمد ياسر');
                              },
                            ),
                          );                        },
                      );
                    },
                    itemCount: 4,

                    shrinkWrap: true,
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
