import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/core/image_helper.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/material.dart';

import '../../../core/style_helper.dart';
import '../../widgets/button.dart';

class AdminOrphansScreen extends StatelessWidget with ImageHelper {
  const AdminOrphansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الأيتام'),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Button(
                width: double.infinity,
                color: Colors.white,
                text: ' إضافة يتيم',
                backgr: primaryColor,
                borderRadius: 5,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.filter_alt_outlined, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '...ابحث',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),

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
