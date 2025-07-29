import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/spacing.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
            title: Text('سياسة الخصوصية', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/privacy_policy.png'),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/privacy.svg'),
                        horizontalSpacing(8),
                        Text('من نحن ؟', style: font16BlackBold),
                      ],
                    ),
                    Text(
                      'نحن في [اسم التطبيق/المنصة] نؤمن بأهمية الخصوصية ونسعى لحماية بيانات جميع مستخدمينا، خصوصًا في بيئة إنسانية تهدف إلى رعاية الأيتام وتمكين أهل الخير من العطاء بأمان وشفافية. نلتزم باستخدام البيانات فقط بما يخدم أهداف المنصة ويحمي المستخدم.',
                      style: font16BlackMedium,
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/privacy_policy.svg'),
                        horizontalSpacing(8),
                        Text('المعلومات التي نجمعها', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(8),
                    Text.rich(
                      TextSpan(
                        text:
                            'عند استخدامك لتطبيقنا، قد نقوم بجمع بعض المعلومات بهدف تحسين تجربتك وضمان جودة الخدمات، مثل:\n',
                        style: font16BlackMedium,
                        children: [
                          TextSpan(text: ' • الاسم الكامل\n'),
                          TextSpan(text: ' • رقم الهاتف والبريد الإلكتروني\n'),
                          TextSpan(
                            text:
                                ' • بيانات التبرعات (المبالغ، التواريخ، الحالات المدعومة)\n',
                          ),
                          TextSpan(
                            text:
                                ' • المستندات المُرفقة (مثل إيصالات التبرع)\n',
                          ),
                          TextSpan(
                            text:
                                ' • بيانات الاستخدام (مثل الصفحات التي تزورها في التطبيق)\n',
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/privacy_policy.svg'),
                        horizontalSpacing(8),
                        Text('كيف نستخدم المعلومات؟', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(8),
                    Text(
                      'نستخدم تقنيات أمنية حديثة لحماية معلوماتك من الوصول غير المصرح به، كما نلتزم بعدم مشاركة بياناتك مع أي جهة خارجية دون إذنك، إلا إذا كان ذلك مطلوبًا بموجب القانون.',
                      style: font16BlackMedium,
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/privacy_use.svg'),
                        horizontalSpacing(8),
                        Text('كيف نحمي بياناتك؟', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(8),
                    Text.rich(
                      TextSpan(
                        text: 'نستخدم المعلومات التي نجمعها فقط من أجل:\n',
                        style: font16BlackMedium,
                        children: [
                          TextSpan(
                            text: ' • ربط المتبرعين بالحالات الإنسانية\n',
                          ),
                          TextSpan(text: ' • تنفيذ عمليات التبرع وتوثيقها\n'),
                          TextSpan(
                            text:
                                ' • التواصل مع المستخدمين لتقديم الدعم أو إرسال إشعارات مهمة\n',
                          ),
                          TextSpan(
                            text: ' • تحسين خدماتنا بناءً على استخدامك\n',
                          ),
                        ],
                      ),
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/system_update.svg'),
                        horizontalSpacing(8),
                        Text('كيف نحمي بياناتك؟', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(8),
                    Text(
                      'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر، وسيتم إشعارك بأي تغييرات عبر التطبيق أو البريد الإلكتروني.',
                      style: font16BlackMedium,
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/email_down.svg'),
                        horizontalSpacing(8),
                        Text('كيف نحمي بياناتك؟', style: font16BlackBold),
                      ],
                    ),
                    verticalSpacing(8),
                    Text(
                      'إذا كان لديك أي استفسار أو رغبت في تعديل أو حذف معلوماتك، يمكنك التواصل معنا عبر:\n privacy@charityapp.ps',
                      style: font16BlackMedium,
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
