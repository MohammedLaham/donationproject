import 'package:donationproject/view/widgets/buildCard.dart';
import 'package:flutter/material.dart';
import 'buildPersonalInfoCardBank.dart';

class StatusRequestBank extends StatelessWidget {
  const StatusRequestBank({super.key,required this.hintRequest,required this.descriptionRequest});
  final String? hintRequest;
  final String? descriptionRequest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.15,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white, size: 28),
                          Expanded(
                            child: Text(hintRequest!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              BuildCard(
                  icon: Icons.info_outline,
                  title: "Order status",
                  description:
                  descriptionRequest              ),

              const SizedBox(height: 12),

              Buildpersonalinfocardbank(),
            ],
          ),
        ),
      ),
    );
  }
}


