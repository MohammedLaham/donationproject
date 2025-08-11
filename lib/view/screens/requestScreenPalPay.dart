import 'package:donationproject/view/widgets/statusrequestBank.dart';
import 'package:flutter/material.dart';

import '../widgets/buildInfoRow.dart';
import '../widgets/satusrequest.dart';
import '../widgets/statusrequestpalpay.dart';

class RequestScreenPalPay extends StatelessWidget {
  const RequestScreenPalPay({super.key});
  @override
  Widget build(BuildContext context) {
    return Statusrequestpalpay(
      hintRequest:
      "The request has been sent successfully and is awaiting approval.",
      descriptionRequest:
      "Your application login request has been sent. Please wait while your submitted data is reviewed and the request is accepted.",
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
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
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textDirection: TextDirection.ltr,
                ),
                const SizedBox(height: 6),
                Text(
                  description,
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

  Widget _buildInfoRow(IconData icon, String title, {String? downloadText}) {
    return BuildInfoRow();
  }
}
