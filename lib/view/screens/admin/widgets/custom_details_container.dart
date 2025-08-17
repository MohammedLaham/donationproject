import 'package:flutter/material.dart';

import '../../../../core/image_helper.dart';
import '../../../../core/style_helper.dart';
import 'custom_container.dart';

class CustomDetailsContainer extends StatelessWidget with ImageHelper {
  final String leading;
  final String title;
  final String subTitle;
  final bool hasEdit;

  const CustomDetailsContainer({Key? key, required this.leading, required this.title, required this.subTitle,  this.hasEdit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.directional(end: 8,top: 8,bottom: 8),
                child: AppSvgImage(leading),
              ),
              Text(title, style: TextStyles.font16BlackBold),
            ],
          ),
          Row(
            children: [
              Text(subTitle, style: TextStyles.font14BlackMedium),
              Spacer(),
              hasEdit?AppSvgImage('edit'):SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );

  }
}
