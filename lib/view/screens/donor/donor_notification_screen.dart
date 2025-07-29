import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonorNotificationScreen extends StatelessWidget {
  const DonorNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('الإشعارات', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(16),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
