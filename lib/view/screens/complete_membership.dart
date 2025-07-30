import 'package:donationproject/core/color/constant.dart';
import 'package:donationproject/view/widgets/button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:donationproject/view/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';

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
    'Bank of Palestine',
    'Islamic Bank',
    'Quds Bank',
    'National Bank',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Complete the membership application',
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
                  'Enter the following information to complete the membership application',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextField(
                controller: _dateBirthController,

                label: '',
                hintText: 'Date Birth',
                prefixIcons: Icons.date_range,
                isDateField: true,
              ),
              SizedBox(height: 20),

              CustomTextField(
                controller: _numberOfFamilyController,
                label: 'Number Of Family',
                prefixIcons: Icons.family_restroom,
              ),
              SizedBox(height: 20),
              Text(
                'Gender',
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
                    'Male',
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
                    'Female',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                'Having a disability',
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
                    'Yes',
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
                    'No',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Receiving support',
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
                    'Bank Account',
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
                    'PalPay',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (accountBank) ...[
                SizedBox(height: 20),
                Text(
                  'Name Of Bank',
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
                  hint: Text('Choose a Bank'),
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
                  'Your bank account number',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  controller: _numberOfFamilyController,
                  label: 'IBAN',
                  prefixIcons: Icons.food_bank,
                ),
              ],
              if (palpay) ...[
                SizedBox(height: 20),
                Text(
                  'IBAN OR Phone Number',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  controller: _numberOfFamilyController,
                  label: 'Account Of PalPay',
                  prefixIcons: Icons.payment,
                ),
              ],
              SizedBox(height: 20),
              Text(
                'The reason for orphanhood',
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
                    'Father',
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
                    'Mother',
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
                    'Both',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (father) ...[
                UploadImageWidget(
                  key: const ValueKey("father-death"),
                  title: "Father's death certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("father-birth"),
                  title: "Birth Certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: 'Submit',
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
                  title: "Mother's death certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("mother-birth"),
                  title: "Birth Certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: 'Submit',
                    onPressed: isReadyToSubmit ? () {} : null,

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
                  title: "Father's death certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("both-mother-death"),
                  title: "Mother's death certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),
                UploadImageWidget(
                  key: const ValueKey("both-birth"),
                  title: "Birth Certificate",
                  onUploadComplete: () {
                    setState(() {
                      _uploadedImagesCount++;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Button(
                    text: 'Submit',
                    onPressed: isReadyToSubmit ? () {} : null,
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
