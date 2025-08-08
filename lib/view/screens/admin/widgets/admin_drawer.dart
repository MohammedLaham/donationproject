
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/image_helper.dart';
import '../../../../core/routers/nav_helper.dart';
import '../../../../core/style_helper.dart';
import '../admin_main_screen.dart';
import '../admin_orphans_screen.dart';

class AdminDrawer extends StatelessWidget with ImageHelper {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: primaryColor,
            padding:  EdgeInsets.only(left: 16,right: 16, top: 40, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/person.png',
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'مرحباً بك',
                      style: TextStyles.font20WhiteBold,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  'آخر تسجيل دخول منذ 30 دقيقة',
                  style: TextStyles.font12WhiteSemiBold,
                ),
              ],
            ),
          ),


          _buildDrawerItem('home', 'الرئيسية', context, true,AdminMainScreen()),
          _buildDrawerItem('orphans', 'الأيتام', context, true,AdminOrphansScreen()),
          _buildDrawerItem('donors', 'المتبرعين', context, false,AdminMainScreen()),
          _buildDrawerItem('request', 'طلبات الأيتام', context, false,AdminMainScreen()),
          _buildDrawerItem('request', 'التبرعات', context, false,AdminMainScreen()),
          _buildDrawerItem('notification', 'الإشعارات', context, false,AdminMainScreen()),
          _buildDrawerItem('setting', 'الإعدادات', context, false,AdminMainScreen()),
          _buildDrawerItem('logout', 'تسجيل الخروج', context, false,AdminMainScreen()),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String icon, String title, BuildContext context, bool active,Widget to) {
    return ListTile(
      leading:  AppSvgImage(icon,color: active ? primaryColor : Colors.black,),
      title: Text(
        title,
        style: TextStyle(
          color: active ? primaryColor : Colors.black,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          fontFamily: 'Cairo',
          fontSize: 16
        ),
      ),
      onTap: () => NavHelper().go(context, to),
    );
  }
}
