import 'package:donationproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedLabelStyle: font12GreenMedium.copyWith(color: mainGray),
      selectedItemColor: primaryColor,
      selectedLabelStyle: font12GreenMedium,
      unselectedItemColor: mainGray,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgs/ic_home.svg'),
          activeIcon: SvgPicture.asset('assets/svgs/ic_active_home.svg'),
          label: 'الرئيسية', //TODO: Localize this label
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/svgs/ic_active_donate.svg'),
          icon: SvgPicture.asset('assets/svgs/ic_donate.svg'),
          label: 'التبرع', //TODO: Localize this label
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/svgs/ic_active_profile.svg'),
          icon: SvgPicture.asset('assets/svgs/ic_profile.svg'),
          label: 'حسابي', //TODO: Localize this label
        ),
      ],
    );
  }
}
