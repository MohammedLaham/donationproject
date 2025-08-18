import 'package:donationproject/core/image_helper.dart';
import 'package:donationproject/view/screens/admin/donors/donor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routers/nav_helper.dart';
import '../../../../core/style_helper.dart';
import '../donations/donation_details_screen.dart';
import 'custom_container.dart';

class DonationCard extends StatelessWidget with ImageHelper{
  final String? donor;
  final String orphan;
  final String amount;
  final String? date;
  const DonationCard({Key? key,  this.donor, required this.orphan, required this.amount,  this.date }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child:
        InkWell(
          onTap: () {
            NavHelper().go(context,
                date != null?
                DonorDetailsScreen()
                :DonationDetailsScreen(),
                replace: true,);
          },
          child: Row(
              children:[
                Image.asset('assets/images/person.png',height: 55, width: 55, fit: BoxFit.cover),
                SizedBox(width:8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date.isNull?donor??'':orphan, style: TextStyles.font16BlackBold),
                      SizedBox(height:4),
                      Row(
                        children: [
                          Row(
                            children: [
                              AppSvgImage('orphans'),
                              SizedBox(width:4),
                              Text(date??orphan,
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
          ),
        )
    );
  }
}
