import 'package:flutter/material.dart';

import '../widgets/custom_appBar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الإشعارات'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
