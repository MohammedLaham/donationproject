import 'package:donationproject/core/image_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/style_helper.dart';
import 'custom_container.dart';

class AttachmentItem {
  final String title;
  final VoidCallback? onTap;

  AttachmentItem({required this.title, this.onTap});
}

class AttachmentWidget extends StatelessWidget with ImageHelper{
  final String sectionTitle;
  final List<AttachmentItem> attachments;
  final Widget? leadingIcon;

  const AttachmentWidget({
    Key? key,
    required this.sectionTitle,
    required this.attachments,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (leadingIcon != null) ...[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8, top: 8, bottom: 8),
                  child: leadingIcon,
                ),
              ],
              Text(sectionTitle, style: TextStyles.font16BlackBold),
            ],
          ),

          ...attachments.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(item.title, style: TextStyles.font14BlackMedium),
                  const Spacer(),
                  GestureDetector(
                    onTap: item.onTap,
                    child: AppSvgImage('download'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
