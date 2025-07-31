import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrphanChatScreen extends StatefulWidget {
  const OrphanChatScreen({super.key, required this.orphan});
  final String orphan;

  @override
  State<OrphanChatScreen> createState() => _OrphanChatScreenState();
}

class _OrphanChatScreenState extends State<OrphanChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
            leading: GestureDetector(
              child: SvgPicture.asset('assets/svgs/ic_arrow_left.svg'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text(widget.orphan, style: font20WhiteBold),
          ),
          // البيانات الشخصية للمتبرع
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
