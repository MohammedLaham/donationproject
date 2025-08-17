import 'package:donationproject/view/screens/admin/widgets/custom_add_btn.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_search_section.dart';
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/routers/nav_helper.dart';
import '../orphans/add_orphan_screen.dart';
import '../widgets/donation_card.dart';
import 'add_donor_screen.dart';

class AdminDonorsScreen extends StatelessWidget {
  const AdminDonorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'المتبرعين'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustmAddBtn(
              text: 'إضافة متبرع',
              onPressed: (){
                NavHelper().go(context, AddDonorScreen(),replace: true);
              },
            ),

            const SizedBox(height: 12),
            CustomSearchSection(),
            const SizedBox(height: 16),

            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),
            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),
            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),

          ],
        ),
      ),
    );
  }
}
