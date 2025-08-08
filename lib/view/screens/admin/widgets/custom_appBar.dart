import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/image_helper.dart';
import '../../../../core/style_helper.dart';


class CustomAppBar extends StatelessWidget with ImageHelper implements PreferredSizeWidget{
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyles.font20WhiteBold,
      ),
      centerTitle: true,
      leading: const SizedBox.shrink(),
      actions: [
        InkWell(
          onTap: onBackPressed ?? () => Navigator.pop(context),
          child: AppSvgImage(
            'arrow-leftCircle',
            height: 28,
            width: 28,
          ),
        ),
      ],
      actionsPadding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
    );
  }
}
