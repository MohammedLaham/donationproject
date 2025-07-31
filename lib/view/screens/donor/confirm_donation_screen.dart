import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 //TODO: ضايل المسافة بين النص والايقونة في العملة 
class ConfirmDonationScreen extends StatefulWidget {
  const ConfirmDonationScreen({super.key});

  @override
  State<ConfirmDonationScreen> createState() => _ConfirmDonationScreenState();
}

class _ConfirmDonationScreenState extends State<ConfirmDonationScreen> {
  String? _selectedCurrency;

  final List<String> _currencies = ['الشيكل', 'الدولار', 'الدينار', 'اليورو'];
  bool isDropdownOpened = false;

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
            title: Text('تأكيد التبرع', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
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
                      keyboardType: TextInputType.number,
                      hintText: '100',
                      hintTextStyle: TextStyle(
                        fontFamily: 'Cairo',
                        color: mainGray,
                        fontWeight: FontWeightHeper.medium,
                        fontSize: 14.sp,
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/svgs/hand_money.svg',
                        color: mainGray,
                        // fit: BoxFit.fitWidth,
                      ),
                      backgroundColor: lightGray,
                      textColor: mainGray,

                      borderRadius: 4,
                    ),
                    verticalSpacing(8),
                    Text('العملة', style: font16BlackMedium),
                    verticalSpacing(8),

                    DropdownButtonFormField2<String>(
                      style: font16BlackMedium.copyWith(
                        color: mainGray,
                        fontWeight: FontWeightHeper.normal,
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          isDropdownOpened
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: mainBlack,
                        ),
                      ),

                      onMenuStateChange: (isOpen) {
                        setState(() {
                          isDropdownOpened = isOpen;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: mainGray),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: _selectedCurrency,

                      isExpanded: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightGray,
                        prefixIcon: Icon(Icons.attach_money, size: 24),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,

                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),

                      items: _currencies
                          .map(
                            (currency) => DropdownMenuItem<String>(
                              value: currency,
                              child: Text(currency),
                            ),
                          )
                          .toList(),

                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCurrency = value;
                          });
                        }
                      },
                    ),
                    verticalSpacing(8),
                    Text('وثيقة إثبات التبرع', style: font16BlackMedium),
                    verticalSpacing(16),
                    // مربع رقع الصورة
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        dashPattern: [10, 5],
                        color: greenColor,
                        strokeWidth: 1,
                        padding: EdgeInsets.all(8),
                        radius: Radius.circular(8),
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
            ),
          ),
        ],
      ),
    );
  }
}
