import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DonorDonationScreen extends StatelessWidget {
  const DonorDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom AppBar
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {},
            ),
            title: Text('سجل تبرعاتك', style: font20WhiteBold),
          ),
          Padding(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
