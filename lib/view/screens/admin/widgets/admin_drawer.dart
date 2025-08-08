
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/image_helper.dart';
import '../../../../core/style_helper.dart';

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


          _buildDrawerItem('home', 'الرئيسية', context, true),
          _buildDrawerItem('orphans', 'الأيتام', context, false),
          _buildDrawerItem('donors', 'المتبرعين', context, false),
          _buildDrawerItem('request', 'طلبات الأيتام', context, false),
          _buildDrawerItem('request', 'التبرعات', context, false),
          _buildDrawerItem('notification', 'الإشعارات', context, false),
          _buildDrawerItem('setting', 'الإعدادات', context, false),
          _buildDrawerItem('logout', 'تسجيل الخروج', context, false),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String icon, String title, BuildContext context, bool active) {
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
      onTap: () => Navigator.pop(context),
    );
  }
}
