import 'package:donationproject/view/screens/verify_code.dart';
import 'package:donationproject/view/widgets/button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/color/constant.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Forgot your password',
          style: TextStyle(fontSize: 20, color: secondaryColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(
              'Forget your password ?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),SizedBox(height: 20,),
            Text(
              'We will send the verification code to your email',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 30,),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(label: 'Email',prefixIcons: Icons.email,),
            ),
            SizedBox(height: 30,),
            Button(text: 'Continue ', onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifyCode(isOrphan: true,)),
              );
            }, backgr: primaryColor, color: secondaryColor, width: MediaQuery.of(context).size.width * 0.9, borderRadius: 8)
          ],
        ),
      ),
    );
  }
}
