import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:donationproject/core/helpers/helpers.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/screens/donor/change_password_screen.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:donationproject/view/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PersonalDonorDetailedInfoScreen extends StatefulWidget {
  final String name;
  final String currentPassword;
  final String email;

  const PersonalDonorDetailedInfoScreen({
    super.key,
    required this.name,
    required this.currentPassword,
    required this.email,
  });

  @override
  State<PersonalDonorDetailedInfoScreen> createState() =>
      _PersonalDonorDetailedInfoScreenState();
}

class _PersonalDonorDetailedInfoScreenState
    extends State<PersonalDonorDetailedInfoScreen>
    with Helpers {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.currentPassword);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('البيانات الشخصية', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                infoCard(
                  title: 'الاسم الكامل',
                  subtitle: 'متبرع 19',
                  leadingIcon: Icon(Icons.person),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),

                  onTap: () {
                    showCustomDialog(
                      context: context,
                      title: ' تعديل الإسم الكامل',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('الإسم الكامل', style: font16BlackMedium),
                          verticalSpacing(8),
                          CustomTextField(
                            horizantal: 8.w,
                            borderRadius: 4,
                            controller: nameController,
                            prefixIcon: Icon(Icons.person),
                            textColor: mainBlack,
                            label: '',
                            backgroundColor: lightGray,
                          ),
                        ],
                      ),
                      confirmButtonText: 'حفظ',
                      onConfirm: () {
                        // TODO: Save the changes
                      },
                    );
                  },
                ),
                infoCard(
                  title: 'البريد الالكتروني',
                  subtitle: 'Ahmed123@gmail.com',
                  leadingIcon: Icon(Icons.email_outlined, color: greenColor),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),

                  onTap: () {
                    showCustomDialog(
                      context: context,
                      title: ' تعديل الإسم الكامل',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('الإسم الكامل', style: font16BlackMedium),
                          verticalSpacing(8),
                          CustomTextField(
                            horizantal: 8.w,
                            borderRadius: 4,
                            controller: emailController,
                            prefixIcon: Icon(Icons.email_outlined),
                            textColor: mainBlack,
                            label: '',
                            backgroundColor: lightGray,
                          ),
                        ],
                      ),
                      confirmButtonText: 'حفظ',
                      onConfirm: () {
                        // TODO: Save the changes
                      },
                    );
                  },
                ),
                infoCard(
                  title: 'كلمة المرور',
                  subtitle: '12345',
                  leadingIcon: Icon(Icons.person, color: greenColor),
                  trailingIcon: SvgPicture.asset('assets/svgs/edit.svg'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChangePasswordScreen(currentPassword: '12345'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
