import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String additionalInfo;
  final IconData icon;
  final bool isCheck;
  final String? buttonText;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.additionalInfo,
    required this.icon,
    this.isCheck = false,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (isCheck) Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            SizedBox(height: 8),
            Text(subtitle, style: TextStyle(fontSize: 16)),
            if (additionalInfo.isNotEmpty) ...[
              SizedBox(height: 4),
              Text(additionalInfo, style: TextStyle(color: Colors.grey)),
            ],
            if (buttonText != null) ...[
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // يمكنك إضافة الوظيفة هنا
                },
                child: Text(buttonText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
