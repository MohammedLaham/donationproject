import 'package:donationproject/view/screens/donor/change_password_screen.dart';
import 'package:donationproject/view/screens/donor/donor_donation_screen.dart';
import 'package:donationproject/view/screens/donor/donor_home_screen.dart';
import 'package:donationproject/view/screens/donor/donor_profile_screen.dart';
import 'package:donationproject/view/screens/donor/personal_donor_detailed_info_screen.dart';
import 'package:donationproject/view/screens/donor/privacy_policy_screen.dart';
import 'package:donationproject/view/screens/donor/share_app_screen.dart';
import 'package:donationproject/view/screens/donor/terms_and_conditions_screen.dart';
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
    DonorProfileScreen(
      //   onNavigateTo: (int index) {
      // //     setState(() {
      // //   _selectedIndex = index;
      // // });
      //   },
    ),

    // const PersonalDonorDetailedInfoScreen(),
    // const ChangePasswordScreen(),
    // const ShareAppScreen(),
    // const PrivacyPolicyScreen(),
    // const TermsAndConditionsScreen(),
  ];

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
