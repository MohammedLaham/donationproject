import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routers/nav_helper.dart';
import '../widgets/custom_add_btn.dart';
import '../widgets/custom_appBar.dart';

class AddDonorScreen extends StatelessWidget {
  const AddDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'إَضافة متبرع'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: Column(
          children: [
            CustomTextField(
                label:'الإسم الكامل',prefixIcons:Icons.person_2_rounded,
              textColor: Colors.black,
              backgroundColor: secondaryColor,
              hintText: 'فؤاد امير حبوب',
              horizantal: 16,
            ),
            SizedBox(height: 16,),
            CustomTextField(
                label:'البريد الإلكتروني',prefixIcons:Icons.person_2_rounded,
              textColor: Colors.black,
              backgroundColor: secondaryColor,
              hintText: 'example@example.com',
              horizantal: 16,
            ),
            SizedBox(height: 24,),

            CustmAddBtn(
              text: 'إضافة متبرع',
              onPressed: (){
              },
            ),


          ],
        ),
      ),
    );
  }
}
