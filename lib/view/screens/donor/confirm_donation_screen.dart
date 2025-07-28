import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmDonationScreen extends StatelessWidget {
  const ConfirmDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              leading: GestureDetector(
                child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('تأكيد التبرع', style: font20WhiteBold),
            ),
            // البيانات الشخصية للمتبرع
            Padding(
              padding: EdgeInsetsDirectional.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'لضمان توثيق تبرعك بشكل صحيح وتحديث بيانات المستفيدين، نرجو إدخال مبلغ التبرع ورفع وثيقة تثبت عملية التحويل (مثل إيصال بنكي أو لقطة شاشة)، ثم الضغط على "تأكيد التبرع".',
                    style: font16BlackBold.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpacing(16),
                  Text(
                    'ادخل المبلغ الذي تم التبرع به',
                    style: font16BlackMedium,
                  ),
                  verticalSpacing(8),

                  CustomTextField(
                    label: '',
                    // hintText: '100',
                    backgroundColor: lightGray,
                    borderRadius: 4,
                  ),
                  verticalSpacing(8),
                  Text('العملة', style: font16BlackMedium),
                  verticalSpacing(8),

                  CustomTextField(
                    label: '',
                    // hintText: '100',
                    backgroundColor: lightGray,
                    borderRadius: 4,
                  ),
                  verticalSpacing(8),
                  Text('وثيقة إثبات التبرع', style: font16BlackMedium),
                  verticalSpacing(16),
                  // مربع رقع الصورة
                  Container(
                    padding: EdgeInsetsDirectional.all(8),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: greenColor, width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CustomElevatedButton(
                      onTap: () {},
                      text: 'قم برفع الصورة',
                      btn_height: 115,
                      icon: SvgPicture.asset('assets/svgs/upload_cloud.svg'),
                    ),
                  ),
                  verticalSpacing(8),
                  Text(
                    'أقصى حد رفع الصورة 2 جيجابايت',
                    style: font12BlackMedium.copyWith(color: greenColor),
                  ),
                  verticalSpacing(11),
                  CustomElevatedButton(
                    onTap: () {},
                    text: 'تأكيد التبرع',
                    textFontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
