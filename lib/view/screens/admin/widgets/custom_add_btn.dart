import 'package:donationproject/core/image_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/style_helper.dart';

class CustmAddBtn extends StatelessWidget with ImageHelper{
  final String text;
  final bool isAdd;
  final VoidCallback? onPressed;

  const CustmAddBtn({super.key, required this.text, this.onPressed, this.isAdd = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,),
      child:
      ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyles.font16WhiteBold),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppSvgImage(isAdd?'add-circle':'del', width: 24, height: 24),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
