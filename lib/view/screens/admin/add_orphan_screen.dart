import 'package:donationproject/view/screens/admin/widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOrphanScreen extends StatelessWidget {
  const AddOrphanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'إَضافة يتيم'),


    );
  }
}
