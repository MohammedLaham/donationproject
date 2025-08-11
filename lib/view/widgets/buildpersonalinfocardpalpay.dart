import 'package:flutter/material.dart';

import 'buildInfoRow.dart';

class BuildInfoCardPalPay extends StatelessWidget {
  const BuildInfoCardPalPay({super.key});



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
      child: Column(
        children: [
          BuildInfoRow(icon: Icons.person, title:  "Ahmed Yaser"),
          BuildInfoRow(icon:Icons.email, title: "Ahmed123@gmail.com"),
          BuildInfoRow(icon:Icons.calendar_today,title: "11/11/2011"),
          BuildInfoRow(icon:Icons.family_restroom,title:  "5"),
          BuildInfoRow(icon:Icons.male, title:"Male"),
          BuildInfoRow(icon:Icons.accessibility_new, title: "Has Disability"),
          BuildInfoRow(icon:Icons.phone, title: "0595107581"),
          BuildInfoRow(icon: Icons.paypal,title: 'The Number Of : 0595107581'),
          BuildInfoRow(icon: Icons.price_change_outlined,title: 'the amount : 5250'),
          BuildInfoRow(icon:Icons.image, title: "Birth Certificate", downloadText: "Download"),
          BuildInfoRow(icon:Icons.image, title: "Father's Death Certificate", downloadText: "Download"),
        ],
      ),
    );
  }
}
