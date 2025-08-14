import 'dart:io';
import 'package:donationproject/view/screens/complete_membership.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/color/constant.dart';
import '../widgets/custom_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isOrphan = true;

  final _picker = ImagePicker();
  File? _personalPhoto;
  File? _idImage;

  Future<void> pickImage(bool fromCamera, bool isPersonalPhoto) async {
    final pickedFile = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        if (isPersonalPhoto) {
          _personalPhoto = File(pickedFile.path);
        } else {
          _idImage = File(pickedFile.path);
        }
      });
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Widget buildImagePicker(String label, File? imageFile, bool isPersonalPhoto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => pickImage(true, isPersonalPhoto),
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () => pickImage(false, isPersonalPhoto),
            ),
            if (imageFile != null)
              SizedBox(
                width: 80,
                height: 80,
                child: Image.file(imageFile, fit: BoxFit.cover),
              ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FCF9),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.all(8.0),
      //       child: Icon(Icons.question_mark),
      //       // child: Image.asset('assets/images/helpimg.png'),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 70),

            // Toggle
            Container(
              height: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isOrphan = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isOrphan ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '11'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: isOrphan ? blackColor : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isOrphan = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isOrphan ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '12'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: !isOrphan ? Colors.black : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(8.0),

                child: Text(
                  '13'.tr,
                  style: TextStyle(fontSize: 18,),

              ),
            ),
            SizedBox(height: 30),

            // Fields
            CustomTextField(
              prefixIcons: Icons.person,
              label: '14'.tr,
              controller: _nameController,
            ),
            SizedBox(height: 30),
            CustomTextField(
              prefixIcons: Icons.email,
              label: '4'.tr,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            CustomTextField(
              isPassword: true,
              prefixIcons: Icons.lock,
              label: '5'.tr,
              controller: _passwordController,
            ),
            SizedBox(height: 30),

            CustomTextField(
              isPassword: true,
              prefixIcons: Icons.lock,
              label: '15'.tr,
              controller: _confirmPasswordController,
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  '16'.tr,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  '17'.tr,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            // if (!isOrphan) ...[
            //   // const SizedBox(height: 20),
            //   // Align(
            //   //   alignment: Alignment.centerLeft,
            //   //   child: Text(
            //   //     'Upload Documents',
            //   //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //   //   ),
            //   // ),
            //   // const SizedBox(height: 8),
            //   // buildImagePicker("Personal Photo", _personalPhoto, true),
            //   // buildImagePicker("ID / Passport", _idImage, false),
            // ],

            const SizedBox(height: 30),

            // Submit
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (isOrphan) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteMembership(),
                      ),
                    );
                  }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009963),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child:  Text(
                  '10'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
