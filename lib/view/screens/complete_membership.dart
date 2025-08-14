import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/view/screens/requestScreenBank.dart';
import 'package:donationproject/view/screens/requestScreenPalPay.dart';
import 'package:donationproject/view/widgets/button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:donationproject/view/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteMembership extends StatefulWidget {
  const CompleteMembership({super.key});
  @override
  State<CompleteMembership> createState() => _CompleteMembershipState();
}

class _CompleteMembershipState extends State<CompleteMembership> {
  final TextEditingController _dateBirthController = TextEditingController();
  final TextEditingController _numberOfFamilyController =
      TextEditingController();
  int _uploadedImagesCount = 0;

  int get requiredUploads {
    if (father || mother) return 2;
    if (both) return 3;
    return 0;
  }

  bool get isReadyToSubmit => _uploadedImagesCount >= requiredUploads;

  bool male = false;
  bool female = false;
  bool yes = false;
  bool no = false;
  bool accountBank = false;
  bool palpay = false;
  bool father = false;
  bool mother = false;
  bool both = false;
  String? selectedBank;
  List<String> banks = [
    '39'.tr,
    '40'.tr,
    '41'.tr,
    '42'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          '18'.tr,
          style: TextStyle(fontSize: 20, color: secondaryColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '19'.tr,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextField(
                controller: _dateBirthController,

                label: '',
                hintText: '20'.tr,
                prefixIcons: Icons.date_range,
                isDateField: true,
              ),
              SizedBox(height: 20),

              CustomTextField(
                controller: _numberOfFamilyController,
                label: '21'.tr,
                prefixIcons: Icons.family_restroom,
              ),
              SizedBox(height: 20),
              Text(
                '22'.tr,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: male,
                    onChanged: (value) {
                      setState(() {
                        male = value!;
                        female = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '23'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Checkbox(
                    value: female,
                    onChanged: (value) {
                      setState(() {
                        female = value!;
                        male = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '24'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                '25'.tr,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: yes,
                    onChanged: (value) {
                      setState(() {
                        yes = value!;
                        no = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '26'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Checkbox(
                    value: no,
                    onChanged: (value) {
                      setState(() {
                        no = value!;
                        yes = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '27'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '28'.tr,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: accountBank,
                    onChanged: (value) {
                      setState(() {
                        accountBank = value!;
                        palpay = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '29'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Checkbox(
                    value: palpay,
                    onChanged: (value) {
                      setState(() {
                        palpay = value!;
                        accountBank = false;
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '30'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (accountBank) ...[
                SizedBox(height: 20),
                Text(
                  '31'.tr,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: selectedBank,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFE5F5F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  hint: Text('32'.tr),
                  icon: Icon(Icons.arrow_drop_down, color: primaryColor),
                  dropdownColor: Colors.white,
                  items: banks.map((bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBank = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text(
                  '33'.tr,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  controller: _numberOfFamilyController,
                  label: '34'.tr,
                  prefixIcons: Icons.food_bank,
                ),
              ],
              if (palpay) ...[
                SizedBox(height: 20),
                Text(
                  '35'.tr,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  controller: _numberOfFamilyController,
                  label: '36'.tr,
                  prefixIcons: Icons.payment,
                ),
              ],
              SizedBox(height: 20),
              Text(
                '37'.tr,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: father,
                    onChanged: (value) {
                      setState(() {
                        father = value!;
                        mother = false;
                        both = false;
                        _uploadedImagesCount = 0; // 🔁 reset the counter
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '38'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 25),
                  Checkbox(
                    value: mother,
                    onChanged: (value) {
                      setState(() {
                        mother = value!;
                        father = false;
                        both = false;
                        _uploadedImagesCount = 0; // 🔁 reset the counter
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '43'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 25),
                  Checkbox(
                    value: both,
                    onChanged: (value) {
                      setState(() {
                        both = value!;
                        father = false;
                        mother = false;
                        _uploadedImagesCount = 0; // 🔁 reset the counter
                      });
                    },
                    activeColor: primaryColor,
                    // لون الصح
                    checkColor: secondaryColor,
                    // لون علامة الصح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ), // يجعل الزوايا دائرية
                    ),
                  ),
                  Text(
                    '44'.tr,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (father) ...[
                UploadImageWidget(
                  key: const ValueKey("father-death"),
                  title: '45'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("father-birth"),
                  title: '48'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: '49'.tr,
                    onPressed: isReadyToSubmit ? () {} : null,
                    backgr: isReadyToSubmit ? primaryColor : grayColor,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: secondaryColor,
                    borderRadius: 8,
                  ),
                ),
              ],
              if (mother) ...[
                UploadImageWidget(
                  key: const ValueKey("mother-death"),
                  title: '50'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("mother-birth"),
                  title: '48'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: '49'.tr,
                    onPressed: isReadyToSubmit ? () {

                    } : null,

                    backgr: isReadyToSubmit ? primaryColor : grayColor,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: secondaryColor,
                    borderRadius: 8,
                  ),
                ),
              ],
              if (both) ...[
                UploadImageWidget(
                  key: const ValueKey("both-father-death"),
                  title: '45'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("both-mother-death"),
                  title:'50'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("both-birth"),
                  title: '48'.tr,
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: '49'.tr,
                    onPressed: isReadyToSubmit
                        ? () {
                      if(palpay){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestScreenPalPay(),
                          ),
                        );
                      }else if(accountBank){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestScreenBank(),
                          ),
                        );
                      }

                          }
                        : null,
                    backgr: isReadyToSubmit ? primaryColor : grayColor,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: secondaryColor,
                    borderRadius: 8,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
