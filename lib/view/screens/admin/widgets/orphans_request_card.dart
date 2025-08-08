import 'package:flutter/material.dart';

import '../../../../core/color/constant.dart';
import '../../../../core/style_helper.dart';
import 'custom_container.dart';

class OrphansRequestCard extends StatelessWidget {
  final String name;
  final String age;
  final bool hasDisability;

  const OrphansRequestCard({
    super.key, required this.name, required this.age, required this.hasDisability,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/person.png',
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyles.font16BlackBold),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(
                        hasDisability ? Icons.check_circle : Icons.cancel,
                        color: hasDisability ? primaryColor : Colors.red,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        hasDisability ? 'يعاني من إعاقة' : 'لا يعاني من إعاقة',
                        style: TextStyles.font12BlackMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(age, style: TextStyles.font14BlackMedium),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
