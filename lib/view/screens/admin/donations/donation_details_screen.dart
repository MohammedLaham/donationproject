import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/view/screens/admin/widgets/attachment_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/image_helper.dart';
import '../../../widgets/button.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_details_container.dart';
import '../widgets/donation_card.dart';

class DonationDetailsScreen extends StatelessWidget with ImageHelper {
  const DonationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'التبرعات'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomDetailsContainer(
                    title: 'المتبرع',
                    leading: 'donors',
                    subTitle: 'متبرع 19',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomDetailsContainer(
                    title: 'اليتيم',
                    leading: 'orphans',
                    subTitle: 'أحمد ياسر',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDetailsContainer(
                    title: 'المبلغ',
                    leading: 'amount',
                    subTitle: '100',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomDetailsContainer(
                    title: 'العملة',
                    leading: 'money',
                    subTitle: 'شيكل',
                  ),
                ),
              ],
            ),
            AttachmentWidget(
              sectionTitle: 'الصور المرفقة',
              attachments: [
                AttachmentItem(title: 'إشعار البنك', onTap: () {}),
              ],
              leadingIcon: AppSvgImage('img'),
            ),
            Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0,top: 8.0),
                    child: Button(text: 'تأكيد التبرع',color:Colors.white,backgr: primaryColor,onPressed: (){}, width: double.infinity,borderRadius: 8,),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0,top: 8.0),
                    child: Button(text: 'رفض التبرع',color:Colors.red,backgr: Colors.white,onPressed: (){},borderColor: Colors.red, width: double.infinity,borderRadius: 8,),
                  )),
                ]),
          ],
        ),
      ),
    );
  }
}
