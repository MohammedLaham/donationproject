import 'package:donationproject/view/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../widgets/custom_appBar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'الإشعارات'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            CustomToggle(
                firstLabel: 'إضافة إشعار',
                secondLabel: 'المجدولة',
          isFirstSelected: isAdd,
          activeColor: primaryColor,
          onChanged: (value) {
            setState(() {
              isAdd = value;
            });
          },
        ),
        ]
    ),)
    );
  }
}
