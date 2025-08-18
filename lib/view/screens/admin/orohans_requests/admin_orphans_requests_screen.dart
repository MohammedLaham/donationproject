import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../widgets/custom_toggle.dart';
import '../widgets/orphans_request_card.dart';

class AdminOrphansRequestsScreen extends StatefulWidget {
  const AdminOrphansRequestsScreen({Key? key}) : super(key: key);

  @override
  State<AdminOrphansRequestsScreen> createState() => _AdminOrphansRequestsScreenState();
}

class _AdminOrphansRequestsScreenState extends State<AdminOrphansRequestsScreen> {
  bool isInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلبات الأيتام'),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 16 ),
        child: Column(
          children: [
            CustomToggle(
              firstLabel: 'قيد الإنتظار',
              secondLabel: 'المرفوضة',
              isFirstSelected: isInProgress,
              activeColor: primaryColor,
              onChanged: (value) {
                setState(() {
                  isInProgress = value;
                });
              },
            ),
            isInProgress?
            Column(
                  children:[
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false,),
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
                  ]
                ):
            Column(
                children:[
                  OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true,denied: true,),
                  OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true,denied: true,),
                  OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false,denied: true,),
                ]
    ),

          ],
        ),
      ),
    );
  }
}
