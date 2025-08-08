import 'package:donationproject/view/screens/admin/widgets/admin_drawer.dart';
import 'package:donationproject/view/screens/admin/widgets/custom_container.dart';
import 'package:donationproject/view/screens/admin/widgets/orphans_request_card.dart';
import 'package:flutter/material.dart';

import '../../../core/color/constant.dart';
import '../../../core/image_helper.dart';
import '../../../core/style_helper.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> with ImageHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Statistics
            Row(
              children: [
                Expanded(child: _buildStatCard('عدد المتبرعين', '200', 'donors')),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('عدد الأيتام', '200', 'orphans')),
              ],
            ),
            const SizedBox(height: 20),

            //  طلبات الأيتام
            _buildSectionHeader('طلبات الأيتام', 'request'),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
            OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
            const SizedBox(height: 20),

            //  التبرعات
            _buildSectionHeader('التبرعات', 'request'),
            _buildDonationCard('متبرع 19', '100 شيكل', 'أحمد ياسر'),
            _buildDonationCard('متبرع 19', '100 شيكل', 'أحمد ياسر'),
            _buildDonationCard('متبرع 19', '100 شيكل', 'أحمد ياسر'),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('الرئيسية', style: TextStyles.font20WhiteBold),
      centerTitle: true,
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildStatCard(String title, String value, String icon) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(title, style: TextStyles.font16GreenBold),
              const SizedBox(width: 6),
              AppSvgImage(icon, color: primaryColor, height: 24, width: 24),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyles.font24BlackExtraBold),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppSvgImage(icon, color: primaryColor, height: 24, width: 24),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyles.font16GreenBold,
              ),
            ],
          ),
          Spacer(),
          Text('عرض الكل', style: TextStyles.font12GreyRegular),
          Icon(Icons.arrow_forward_ios, size: 16, color: lightGreyColor),
        ],
      ),
    );
  }



  Widget _buildDonationCard(String donor, String amount, String orphan) {
    return CustomContainer(
        child:
        Row(
            children:[
              Image.asset('assets/images/person.png',height: 55, width: 55, fit: BoxFit.cover),
              SizedBox(width:8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(donor, style: TextStyles.font16BlackBold),
                    SizedBox(height:4),
                    Row(
                      children: [
                        Row(
                          children: [
                            AppSvgImage('orphans'),
                            SizedBox(width:4),
                            Text(orphan,
                              style: TextStyles.font14BlackMedium,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            AppSvgImage('amount'),
                            SizedBox(width:4),
                            Text(amount,
                              style: TextStyles.font16BlackRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ]
        )
    );
  }
}

