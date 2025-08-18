import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/donation_card.dart';

class AdminDonationsScreen extends StatelessWidget {
  const AdminDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'التبرعات'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),
            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),
            DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),
          ],
        ),
      ),
    );
  }
}
