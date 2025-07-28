import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/core/routing/routes.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonorProfileScreen extends StatelessWidget {
  const DonorProfileScreen({super.key, this.onNavigateTo});

  final void Function(int index)? onNavigateTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Custom AppBar
        CustomAppBar(
          leading: GestureDetector(
            child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('الملف الشخصي', style: font20WhiteBold),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.all(16),
              child: Column(
                children: [
                  // الصورة الشخصية
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          minimumSize: WidgetStateProperty.all(Size(32, 32)),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(24),

                  // عناصر القائمة
                  ProfileMenuItem(
                    title: 'البيانات الشخصية',
                    leadingIcon: Icons.person_outline,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.personalDonorDetailedInfoScreen,
                      );
                      //  onNavigateTo?.call(3);
                    },
                  ),
                  ProfileMenuItem(
                    title: 'تغيير كلمة المرور',
                    leadingIcon: Icons.key_outlined,
                    onTap: () {
                      // onNavigateTo?.call(4); // شاشة تغيير كلمة المرور
                    },
                  ),
                  ProfileMenuItem(
                    title: 'شارك التطبيق',
                    leadingIcon: Icons.share_outlined,
                    onTap: () {
                      // onNavigateTo?.call(5); // شاشة مشاركة التطبيق
                    },
                  ),
                  ProfileMenuItem(
                    title: 'سياسة الخصوصية',
                    leadingIcon: Icons.privacy_tip_outlined,
                    onTap: () {
                      // onNavigateTo?.call(6); // شاشة سياسة الخصوصية
                    },
                  ),
                  ProfileMenuItem(
                    title: 'شروط الاستخدام',
                    leadingIcon: Icons.description_outlined,
                    onTap: () {
                      // onNavigateTo?.call(7); // شاشة شروط الاستخدام
                    },
                  ),
                  ProfileMenuItem(
                    title: 'تسجيل الخروج',
                    leadingIcon: Icons.logout,
                  ),

                  // Card(
                  //   elevation: 0,
                  //   color: lightGray,
                  //   child: ListTile(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     leading: SvgPicture.asset('assets/svgs/personl_info.svg'),
                  //     title: Text('البيانات الشخصية', style: font16BlackBold),
                  //     trailing: Icon(Icons.arrow_forward_ios_rounded),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
