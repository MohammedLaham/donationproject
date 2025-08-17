import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
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
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor,width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isInProgress = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isInProgress ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'قيد الإنتظار',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Cairo',
                            color: isInProgress ? Colors.white : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isInProgress = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isInProgress ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),topRight: Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'المرفوضة',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Cairo',
                            color: !isInProgress ? Colors.white : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isInProgress?
                Column(
                  children:[
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
                    OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
                  ]
                ):
          Column(
          children:[
          OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
        OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  true),
        OrphansRequestCard(name: 'أحمد ياسر',age: '9 سنوات',hasDisability:  false),
        ]
    ),

          ],
        ),
      ),
    );
  }
}
