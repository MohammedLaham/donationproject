import 'package:donationproject/core/image_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/style_helper.dart';

class CustomSearchSection extends StatelessWidget with ImageHelper{
  const CustomSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child:
          TextField(
            decoration: InputDecoration(
              hintText: '...ابحث',
              hintStyle: TextStyles.font14GreyMedium,
              prefixIcon: const Icon(Icons.search,color: lightGreyColor,),
              filled: true,
              fillColor:secondaryColor,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          // CustomTextField(
          //  controller: TextEditingController(),
          //   hintText: '...ابحث',
          //   label:'ابحث' ,
          //   backgroundColor: secondaryColor,
          //   horizantal: 16,
          //   vertical: 0,
          //   prefixIcons:Icons.search,
          //   textColor: lightGreyColor,
          // )

        ),
        const SizedBox(width: 8),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: AppSvgImage('filter', ),
        ),

      ],
    );
  }
}
