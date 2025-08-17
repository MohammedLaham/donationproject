import 'package:donationproject/core/image_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/style_helper.dart';

class SectionHeader extends StatelessWidget with ImageHelper{
  final String title;
  final String icon;
  final bool seeAll;

  const SectionHeader({Key? key, required this.title, required this.icon,  this.seeAll =  true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
          seeAll?
          Row(
            children: [
              Text('عرض الكل', style: TextStyles.font12GreyRegular),
              Icon(Icons.arrow_forward_ios, size: 16, color: lightGreyColor),
            ],
          ):SizedBox.shrink(),  ],
      ),
    );
  }
}
