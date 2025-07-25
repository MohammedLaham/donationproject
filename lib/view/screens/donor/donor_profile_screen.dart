import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonorProfileScreen extends StatelessWidget {
  const DonorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Custom AppBar
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {},
            ),
            title: Text('الملف الشخصي', style: font20WhiteBold),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                // الصورة الشخصية
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 60,
                      child: Icon(Icons.person, color: Colors.white, size: 100),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        minimumSize: WidgetStateProperty.all(Size(32, 32)),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined, color: greenColor),
                    ),
                  ],
                  alignment: AlignmentDirectional.bottomStart,
                ),
                verticalSpacing(24),
                Card(
                  elevation: 0,
                  color: lightGray,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: SvgPicture.asset('assets/svgs/personl_info.svg'),
                    title: Text('البيانات الشخصية', style: font16BlackBold),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
