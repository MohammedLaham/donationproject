import 'package:donationproject/view/screens/donor/donor_donation_screen.dart';
import 'package:donationproject/view/screens/donor/donor_home_screen.dart';
import 'package:donationproject/view/screens/donor/donor_profile_screen.dart';
import 'package:donationproject/view/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DonorMainScreen extends StatefulWidget {
  const DonorMainScreen({super.key});

  @override
  State<DonorMainScreen> createState() => _DonorMainScreenState();
}

class _DonorMainScreenState extends State<DonorMainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = [
    const DonorHomeScreen(),
    const DonorDonationScreen(),
    const DonorProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (int value) {
          _onItemTapped(value);
        },
      ),
      body: _screens[_selectedIndex],
    );
  }
}
