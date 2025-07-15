import 'package:flutter/material.dart';

import '../../constant.dart';
import '../widgets/button.dart';
import '../widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // مفتاح النموذج للتأكد من الإدخال

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // يرجع للصفحة السابقة
          },
        ),
        title: Text('تسجيل الدخول '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('اهلا وسهلا'),
              // اسم المستخدم
              CustomTextField(prefixIcons: Icons.email,label: 'Email / Mobile Number'),
              SizedBox(height: 16),

              // كلمة المرور
              CustomTextField(prefixIcons : Icons.lock,label: 'Password'),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              // زر الدخول
              Button(
                borderRadius: 30,
                width:  MediaQuery.of(context).size.width * 0.8,
                text: 'Login',
                backgr: primaryColor,
                color: secondaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}