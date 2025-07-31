import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/core/routing/routes.dart';
import 'package:donationproject/view/screens/donor/orphan_chat_screen.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_outline_button.dart';
import 'package:donationproject/view/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrphanInfoScreen extends StatelessWidget {
  const OrphanInfoScreen({super.key});

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
            title: Text('معلومات اليتيم', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 60,
                      child: Icon(Icons.person, color: Colors.white, size: 100),
                    ),
                    verticalSpacing(8),
                    // اسم اليتيم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/ic_profile.svg',
                          color: greenColor,
                        ),
                        horizontalSpacing(8),
                        Text('أحمد ياسر', style: font20BlackSemiBold),
                      ],
                    ),
                    verticalSpacing(16),
                    // ازرار التبرع والمراسلة
                    Row(
                      children: [
                        // زر التبرع
                        Expanded(
                          child: CustomElevatedButton(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.confirmDonationScreen,
                              );
                            },
                            textFontSize: 16,
                            text: 'تأكيد التبرع',
                          ),
                        ),
                        horizontalSpacing(16),
                        // زر المراسلة
                        Expanded(
                          child: CustomOutlineButton(
                            text: 'مراسلة',
                            textFontSize: 16,
                            icon: SvgPicture.asset(
                              'assets/svgs/message.svg',
                              color: greenColor,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return OrphanChatScreen(
                                      orphan: 'أحمد ياسر',
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(16.h),
                    // البيانات الشخصية
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/personal_info.svg',
                          color: greenColor,
                        ),
                        horizontalSpacing(8),
                        Text('البيانات الشخصية', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(16.h),
                    //
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: "العمر",
                            subtitle: "9 سنوات",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/age.svg',
                            ),
                          ),
                        ),
                        horizontalSpacing(16.w),
                        Expanded(
                          child: infoCard(
                            title: "الجنس",
                            subtitle: "ذكر",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/gender.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: "تاريخ الميلاد",
                            subtitle: "2014-05-20",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/calendar.svg',
                            ),
                          ),
                        ),
                        horizontalSpacing(16.w),
                        Expanded(
                          child: infoCard(
                            title: "أفراد العائلة",
                            subtitle: "3",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/family_members.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: "سبب اليتم",
                            subtitle: "وفاة الأب",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/orphan_reason.svg',
                            ),
                          ),
                        ),
                        horizontalSpacing(16.w),
                        Expanded(
                          child: infoCard(
                            title: "حالة الإعاقة",
                            subtitle: "يوجد إعاقة",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/disability.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // معلومات الاتصال والتبرع
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/hands_heart.svg',
                          color: greenColor,
                        ),
                        horizontalSpacing(8),
                        Text('معلومات الاتصال والتبرع', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(16.h),
                    // رقم الجوال
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: 'رقم الجوال',
                            subtitle: '0596363654',
                            trailingIcon: SvgPicture.asset(
                              'assets/svgs/copy.svg',
                            ),
                            onTap: () {
                              //TODO:
                            },
                            leadingIcon: Icon(Icons.phone, color: greenColor),
                          ),
                        ),
                      ],
                    ),
                    // بيانات البنك
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: "اسم البنك",
                            subtitle: 'فلسطين',
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/bank.svg',
                            ),
                            trailingIcon: SvgPicture.asset(
                              'assets/svgs/copy.svg',
                            ),
                            onTap: () {
                              //TODO:
                            },
                          ),
                        ),
                        horizontalSpacing(16.w),
                        Expanded(
                          child: infoCard(
                            title: "حساب البنك",
                            subtitle: "999999",
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/bank_account.svg',
                              // fit: BoxFit.cover,
                            ),
                            trailingIcon: SvgPicture.asset(
                              'assets/svgs/copy.svg',
                              width: 20.w,
                            ),
                            onTap: () {
                              //TODO:
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: 'رقم IBAN',
                            subtitle: 'PS92PALS0000000004000000525584',
                            trailingIcon: SvgPicture.asset(
                              'assets/svgs/copy.svg',
                            ),
                            onTap: () {
                              //TODO:
                            },
                            leadingIcon: SvgPicture.asset(
                              'assets/svgs/bank_account.svg',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: infoCard(
                            title: 'حساب Palpay',
                            subtitle: 'ahmad.mohammed92@gmail.com',
                            trailingIcon: SvgPicture.asset(
                              'assets/svgs/copy.svg',
                            ),
                            onTap: () {
                              //TODO:
                            },
                            leadingIcon: Icon(
                              Icons.paypal_outlined,
                              color: greenColor,
                            ),
                            // SvgPicture.asset('assets/svgs/paypal.svg'),
                          ),
                        ),
                      ],
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
