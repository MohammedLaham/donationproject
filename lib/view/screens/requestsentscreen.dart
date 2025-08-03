import 'package:flutter/material.dart';

class RequestSubmittedScreen extends StatelessWidget {
  const RequestSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 📍 LTR
            children: [
              const SizedBox(height: 20),

              // ✅ Green banner with logo
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
                            'assets/images/logo.jpg', // ⚠️ Change as needed
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
                        children: const [
                          Icon(Icons.check_circle, color: Colors.white, size: 28),
                          Expanded(
                            child: Text(
                              "The request has been sent successfully and is awaiting approval.",
                              style: TextStyle(
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

              // ✅ Order status card
              _buildCard(
                icon: Icons.info_outline,
                title: "Order status",
                description:
                "Your application login request has been sent. Please wait while your submitted data is reviewed and the request is accepted.",
              ),

              const SizedBox(height: 12),

              // ✅ Personal info
              _buildPersonalInfoCard(),
            ],
          ),
        ),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.start, // 📍 LTR
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

  Widget _buildPersonalInfoCard() {
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
          _buildInfoRow(Icons.person, "Ahmed Yaser"),
          _buildInfoRow(Icons.email, "Ahmed123@gmail.com"),
          _buildInfoRow(Icons.calendar_today, "11/11/2011"),
          _buildInfoRow(Icons.family_restroom, "5"),
          _buildInfoRow(Icons.male, "Male"),
          _buildInfoRow(Icons.accessibility_new, "Has Disability"),
          _buildInfoRow(Icons.phone, "0598999999"),
          _buildInfoRow(Icons.image, "Birth Certificate", downloadText: "Download"),
          _buildInfoRow(Icons.image, "Father's Death Certificate", downloadText: "Download"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, {String? downloadText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // تبقى نفسها
              children: [
                Icon(icon, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),

          // 🔁 نقل Download إلى اليمين
          if (downloadText != null)
            Text(
              downloadText,
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
