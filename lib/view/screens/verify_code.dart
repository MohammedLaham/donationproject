
import 'package:donationproject/view/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../core/color/constant.dart';
import '../widgets/button.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtexttitleauth.dart';
import 'orphan_screen.dart';


class VerifyCode extends StatelessWidget {
  final bool isOrphan;
  const VerifyCode({super.key,required this.isOrphan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check code"),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
              text: "Please Enter The 6-Digit Code Sent To 0595107581",
            ),
            const SizedBox(height: 15),
            Center(
              child: OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(10),
                numberOfFields: 6,
                // Changed to 6 digits
                borderColor: primaryColor,
                enabledBorderColor: primaryColor,
                focusedBorderColor: primaryColor,
                showFieldAsBox: true,
                textStyle: const TextStyle(fontSize: 18),
                margin: const EdgeInsets.only(right: 8),
                // Handle code changes
                onCodeChanged: (String code) {
                  // You can add validation here
                },
                // Handle submission
                onSubmit: (String verificationCode) {
                  // Handle OTP verification
                  print("Entered OTP: $verificationCode");
                },
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Resend OTP logic
                print("Resend OTP tapped");
              },
              child: Center(
                child: Text(
                  "Resend verify code",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Button(
              borderRadius: 30,
              width:  MediaQuery.of(context).size.width * 0.8,
              text: 'Verify',
              backgr: primaryColor,
              color: Colors.white,
              onPressed: () {
                _goNext(context);
                // Verification logic
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainNavigation()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
  void _goNext(BuildContext context) {
    if (isOrphan) {
      // مثال: شاشة استكمال بيانات اليتيم
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OrphanInfoScreen()),
      );
    } else {
      // المتبرّع يذهب إلى الـ MainNavigation مثلاً
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>SignIn()),
      );
    }
  }

}
