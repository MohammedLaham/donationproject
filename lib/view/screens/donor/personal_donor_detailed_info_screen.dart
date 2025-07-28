import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PersonalDonorDetailedInfoScreen extends StatelessWidget {
  const PersonalDonorDetailedInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('البيانات الشخصية', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                infoCard(
                  title: 'الاسم الكامل',
                  subtitle: 'متبرع 19',
                  leadingIcon: Icon(Icons.person),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),

                  onTap: () {},
                ),
                infoCard(
                  title: 'البريد الالكتروني',
                  subtitle: 'Ahmed123@gmail.com',
                  leadingIcon: Icon(Icons.email_outlined, color: greenColor),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),

                  onTap: () {},
                ),
                infoCard(
                  title: 'كلمة المرور',
                  subtitle: '12345',
                  leadingIcon: Icon(Icons.person, color: greenColor),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
