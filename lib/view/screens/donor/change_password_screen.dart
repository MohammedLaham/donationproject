import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String currentPassword;

  const ChangePasswordScreen({super.key, required this.currentPassword});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController currentPasswordController;
  bool isCurrentObscured = true;
  bool isNewObscured = true;
  bool isConfirmObscured = true;

  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController(
      text: widget.currentPassword,
    );
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('تغيير كلمة المرور', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('كلمة المرور الحالية', style: font16BlackMedium),
                    verticalSpacing(8),

                    CustomTextField(
                      prefixIcon: Icon(Icons.lock_outline),
                      label: '',
                      obscureText: isCurrentObscured,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isCurrentObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: mainGray,
                        ),
                        onPressed: () {
                          setState(() {
                            isCurrentObscured = !isCurrentObscured;
                          });
                        },
                      ),
                      controller: currentPasswordController,
                      backgroundColor: lightGray,
                      textColor: mainGray,
                      borderRadius: 4,
                    ),
                    verticalSpacing(8),
                    Text('كلمة المرور الجديدة', style: font16BlackMedium),
                    verticalSpacing(8),

                    CustomTextField(
                      label: '',
                      textColor: mainGray,
                      prefixIcon: Icon(Icons.lock_outline),
                      // hintText: '100',
                      backgroundColor: lightGray,
                      borderRadius: 4,
                      obscureText: isNewObscured,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isNewObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: mainGray,
                        ),
                        onPressed: () {
                          setState(() {
                            isNewObscured = !isNewObscured;
                          });
                        },
                      ),
                    ),
                    verticalSpacing(8),
                    Text(
                      ' تأكيد كلمة المرور الجديدة',
                      style: font16BlackMedium,
                    ),
                    verticalSpacing(16),
                    CustomTextField(
                      label: '',
                      obscureText: isConfirmObscured,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: mainGray,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmObscured = !isConfirmObscured;
                          });
                        },
                      ),
                      textColor: mainGray,
                      prefixIcon: Icon(Icons.lock_outline),
                      backgroundColor: lightGray,
                      borderRadius: 4,
                    ),
                    verticalSpacing(16),
                    CustomElevatedButton(
                      onTap: () {},
                      text: 'تعيين كلمة المرور',
                      textFontSize: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
