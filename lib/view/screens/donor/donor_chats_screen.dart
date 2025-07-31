import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/screens/donor/change_password_screen.dart';
import 'package:donationproject/view/screens/donor/orphan_chat_screen.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DonorChatsScreen extends StatelessWidget {
  const DonorChatsScreen({super.key});

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
            title: Text('الدردشات', style: font20WhiteBold),
          ),
          // قائمة الدردشات
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsetsDirectional.only(bottom: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: lightGray,
                          ),

                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('أحمد ياسر', style: font16BlackBold),
                                    Spacer(),
                                    Text(
                                      'منذ 1 دقيقة',
                                      style: font12BlackMedium,
                                    ),
                                  ],
                                ),
                                verticalSpacing(9.h),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              radius: 22.5,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            subtitle: Text(
                              'وعليكم السلام ورحمة الله وبركاته',
                              style: font14BlackRegular,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    //TODO: تمرير اليتيم
                                    return OrphanChatScreen(orphan :'أحمد ياسر',);
                                  },
                                ),
                              );
                            },
                            contentPadding: EdgeInsetsDirectional.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
