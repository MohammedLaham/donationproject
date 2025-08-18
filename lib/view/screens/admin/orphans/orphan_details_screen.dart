import 'package:donationproject/core/image_helper.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_add_btn.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_container.dart';
import 'package:donationproject/view/screens/admin/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/style_helper.dart';

class OrphanDetailsScreen extends StatelessWidget with ImageHelper {
  final bool denied;
  const OrphanDetailsScreen({super.key, required this.denied});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'معلومات اليتيم'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              denied?buildStatusContainer():SizedBox.shrink(),
              buildCustomDetailsContainer(leading: 'profile',title:'الإسم الكامل',subTitle: 'أحمد ياسر',hasEdit: true),
              Row(
                children: [
                  Expanded(
                    child:
              buildCustomDetailsContainer(leading:'age' ,title:'العمر' ,subTitle:  '9 سنوات',),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: buildCustomDetailsContainer(title: 'الجنس',leading: 'gen',subTitle: 'ذكر',hasEdit: true),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child:
              buildCustomDetailsContainer(leading:'age' ,title:'تاريخ الميلاد' ,subTitle:  '11/11/2011',hasEdit: true),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: buildCustomDetailsContainer(title: 'أفراد العائلة',leading: 'gen',subTitle: '3',hasEdit: true),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child:
              buildCustomDetailsContainer(leading:'age' ,title:'سبب اليتم' ,subTitle:  'وفاة الأب',hasEdit: true),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: buildCustomDetailsContainer(title: 'حالة الإعاقة',leading: 'gen',subTitle: 'يوجد إعاقة',hasEdit: true),
                  ),
                ],
              ),
              buildCustomDetailsContainer(leading: 'profile',title:'البريد الإلكتروني',subTitle: 'Ahmed123@gmail.com',hasEdit: true),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsGeometry.directional(start: 2.0,end: 8,top: 8,bottom: 8),
                        child: AppSvgImage('img'),
                      ),
                      Text('الصور المرفقة', style: TextStyles.font16BlackBold),
                    ],
                  ),

                  Row(
                    children: [
                      Text('شهادة وفاة الأب', style: TextStyles.font14BlackMedium),
                      Spacer(),
                      AppSvgImage('download'),
                    ],
                  ),Row(
                    children: [
                      Text('شهادة الميلاد', style: TextStyles.font14BlackMedium),
                      Spacer(),
                      AppSvgImage('download'),
                    ],
                  ),
                ],
              ),
            ),

              CustmAddBtn(text: 'حذف يتيم',isAdd: false,onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }

  CustomContainer buildCustomDetailsContainer({required String leading, required String title, required String subTitle, bool hasEdit = false}) {
    return
      CustomContainer(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsGeometry.directional(end: 8,top: 8,bottom: 8),
                              child: AppSvgImage(leading),
                            ),
                            Text(title, style: TextStyles.font16BlackBold),
                          ],
                        ),
                        Row(
                          children: [
                            Text(subTitle, style: TextStyles.font14BlackMedium),
                            Spacer(),
                            hasEdit?AppSvgImage('edit'):SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  );
  }

  Widget buildStatusContainer() {
    return Container(
      child: CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'الطلب مرفوض', icon: 'request',seeAll: false,),
              Text('تم رفض طلب تسجيل الدخول إلى التطبيق',style: TextStyles.font12BlackMedium,),
              Text('شهادة الميلاد لا تطابق للإسم المسجل في التطبيق',style: TextStyles.font12BlackMedium,),
      ],
    )),);
  }
}
