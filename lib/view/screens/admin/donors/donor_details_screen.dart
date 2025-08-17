import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

import '../../../../core/image_helper.dart';
import '../../../../core/style_helper.dart';
import '../widgets/custom_add_btn.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_details_container.dart';
import '../widgets/donation_card.dart';
import '../widgets/orphans_request_card.dart';
import '../widgets/section_header.dart';

class DonorDetailsScreen extends StatelessWidget with ImageHelper {
  const DonorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'معلومات المتبرع'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomDetailsContainer(
                leading: 'profile',
                title: 'الإسم الكامل',
                subTitle: 'المتبرع 19',
                hasEdit: true,
              ),
                CustomDetailsContainer(
                leading: 'profile',
                title: 'البريد الإلكتروني',
                subTitle:  'Ahmed123@gmail.com',
                hasEdit: true,
              ),
              SectionHeader(title: 'الأيتام المتبرع لهم',icon: 'orphans',seeAll: false,),
              DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',date: '20/6/2025',),
              DonationCard(donor:'متبرع 19',orphan: 'أحمد ياسر' ,amount: '100 شيكل',),

              CustmAddBtn(text: 'حذف المتبرع',isAdd: false,onPressed: (){},)
            ],
          ),
        ),
      ),

    );
  }

}
