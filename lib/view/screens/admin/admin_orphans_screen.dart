import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/core/image_helper.dart';
import 'package:donationproject/core/routers/nav_helper.dart';
import 'package:donationproject/view/screens/admin/add_orphan_screen.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_add_btn.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/material.dart';

import '../../../core/style_helper.dart';

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
            buildSearch(),
            const SizedBox(height: 16),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),

          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Row(
            children: [
              Expanded(
              child:
              TextField(
                decoration: InputDecoration(
                  hintText: '...ابحث',
                  hintStyle: TextStyles.font14GreyMedium,
                  prefixIcon: const Icon(Icons.search,color: lightGreyColor,),
                  filled: true,
                  fillColor:secondaryColor,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              // CustomTextField(
              //  controller: TextEditingController(),
              //   hintText: '...ابحث',
              //   label:'ابحث' ,
              //   backgroundColor: secondaryColor,
              //   horizantal: 16,
              //   vertical: 0,
              //   prefixIcons:Icons.search,
              //   textColor: lightGreyColor,
              // )

            ),
              const SizedBox(width: 8),
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppSvgImage('filter', ),
              ),

            ],
          );
  }

  Widget buildButton() {
    return
      Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,),
            child:
            ElevatedButton(
              onPressed:(){},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppSvgImage('add-circle', width: 24, height: 24),
                    ),
                    Text('إضافة يتيم', style: TextStyles.font16WhiteBold),

                  ],
                ),
              ),
            ),

          );
  }
}
