import 'package:donationproject/view/screens/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color/constant.dart';
import '../widgets/button.dart';
import '../widgets/custom_textfield.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // مفتاح النموذج للتأكد من الإدخال

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // appBar: AppBar(
      //
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context); // يرجع للصفحة السابقة
      //     },
      //   ),
      //   title: Text('تسجيل الدخول '),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          SizedBox(height: 80),

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
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3'.tr,
                    style: TextStyle(fontSize: 18, color: primaryColor),
                  ),
                  SizedBox(height: 30),
                  // اسم المستخدم
                  CustomTextField(
                    prefixIcons: Icons.email,
                    label: '4'.tr,
                  ),
                  SizedBox(height: 16),

                  // كلمة المرور
                  CustomTextField(prefixIcons: Icons.lock, label: '5'.tr),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.0, // تكبير الشكل
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // دائرة
                            // حواف خضراء
                          ),
                          child: Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                            activeColor: primaryColor,
                            // لون الصح
                            checkColor: secondaryColor,
                            // لون علامة الصح
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ), // يجعل الزوايا دائرية
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('6'.tr),
                      Spacer(flex: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPassword()),
                          );
                        },
                        child: Text(
                          '7'.tr,
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),

                  // زر الدخول
                  Center(
                    child: Button(
                      borderRadius: 30,
                      width: MediaQuery.of(context).size.width * 0.8,
                      text: '8'.tr,
                      backgr: primaryColor,
                      color: secondaryColor,
                      onPressed: () {},
                    ),
                  ),
               Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '9'.tr,
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: Text(
                            '10'.tr,
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          ),
                        ),
                      ],

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
