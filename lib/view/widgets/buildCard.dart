import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? description;
  const BuildCard({super.key,required this.icon,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: 6),
                Text(
                  description!,
                  style: const TextStyle(fontSize: 14),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
