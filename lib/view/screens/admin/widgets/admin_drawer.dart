import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/image_helper.dart';
import '../../../../core/routers/nav_helper.dart';
import '../../../../core/style_helper.dart';
import '../donations/admin_donations_screen.dart';
import '../donors/admin_donors_screen.dart';
import '../admin_main_screen.dart';
import '../orohans_requests/admin_orphans_requests_screen.dart';
import '../orphans/admin_orphans_screen.dart';

class AdminDrawer extends StatefulWidget  {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer>with ImageHelper {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    AdminMainScreen(),
    AdminOrphansScreen(),
    AdminDonorsScreen(),
    AdminOrphansRequestsScreen(),
    AdminDonationsScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

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
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 16),
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
          _buildDrawerItem(0, 'home', 'الرئيسية', context),
          _buildDrawerItem(1, 'orphans', 'الأيتام', context),
          _buildDrawerItem(2, 'donors', 'المتبرعين', context),
          _buildDrawerItem(3, 'request', 'طلبات الأيتام', context),
          _buildDrawerItem(4, 'request', 'التبرعات', context),
          _buildDrawerItem(5, 'notification', 'الإشعارات', context),
          _buildDrawerItem(6, 'setting', 'الإعدادات', context),
          _buildDrawerItem(7, 'logout', 'تسجيل الخروج', context),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, String icon, String title, BuildContext context) {
    final bool active = index == _selectedIndex;
    return ListTile(
      leading: AppSvgImage(icon, color: active ? primaryColor : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: active ? primaryColor : Colors.black,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          fontFamily: 'Cairo',
          fontSize: 16,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        NavHelper().go(context, _screens[index],replace:true);
      },
    );
  }
}

