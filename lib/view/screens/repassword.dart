import 'package:donationproject/view/widgets/button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/color/constant.dart';

class RePassword extends StatelessWidget {
  const RePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Set password',
          style: TextStyle(fontSize: 20, color: secondaryColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Set Password',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Reset a new, strong password.',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 30),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30,),

            CustomTextField(label: 'Enter Password',prefixIcons: Icons.lock,isPassword: true,),
            SizedBox(height: 30,),
            CustomTextField(label: 'Confirm Password',prefixIcons: Icons.lock,isPassword: true,),
            SizedBox(height: 30,),

            Button(text:'Set Password', onPressed: (){}, backgr: primaryColor, color: secondaryColor, width: MediaQuery.of(context).size.width * 0.9, borderRadius: 8)
          ],
        ),
      ),
    );
  }
}
