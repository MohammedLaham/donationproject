import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/core/image_helper.dart';
import 'package:donationproject/core/routers/nav_helper.dart';
import 'package:donationproject/view/screens/admin/orphans/add_orphan_screen.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_add_btn.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_search_section.dart';
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/style_helper.dart';

class AdminOrphansScreen extends StatelessWidget with ImageHelper {
  const AdminOrphansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الأيتام'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustmAddBtn(
              text: 'إضافة يتيم',
              onPressed: (){
                NavHelper().go(context, AddOrphanScreen(),replace: true);
              },
            ),
            const SizedBox(height: 12),
            CustomSearchSection(),
            const SizedBox(height: 16),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),

          ],
        ),
      ),
    );
  }

}
