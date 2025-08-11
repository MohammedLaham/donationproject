import 'package:flutter/material.dart';

class BuildInfoRow extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? downloadText;
  const BuildInfoRow({super.key,  this.icon, this.title, this.downloadText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  title!,
                  style: const TextStyle(fontSize: 14),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),

          if (downloadText != null)
            Text(
              downloadText!,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.purple,
                decoration: TextDecoration.underline,
              ),
              textDirection: TextDirection.ltr,
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
