
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/image_helper.dart';

class AdminDrawer extends StatelessWidget with ImageHelper {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: primaryColor),
            accountName: const Text('مرحباً بك'),
            accountEmail: const Text('آخر تسجيل دخول منذ 30 دقيقة'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: primaryColor),
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
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
