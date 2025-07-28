import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text('الدردشات', style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(children: [
              ],
            ),
          ),
        ],
      ),
    );
  }
}
