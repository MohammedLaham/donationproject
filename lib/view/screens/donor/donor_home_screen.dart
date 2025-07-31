import 'package:donationproject/constant.dart';
import 'package:donationproject/core/helpers/font_weight_helper.dart';
import 'package:donationproject/core/routing/routes.dart';
import 'package:donationproject/view/widgets/custom_app_bar.dart';
import 'package:donationproject/view/widgets/custom_card.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';

class DonorHomeScreen extends StatefulWidget {
  const DonorHomeScreen({super.key});

  @override
  State<DonorHomeScreen> createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final GlobalKey _searchFieldKey = GlobalKey();
  OverlayEntry? _filterOverlayEntry;
  final LayerLink _layerLink = LayerLink();

  List orphanList = [
    ['أحمد سعيد', 3, 2, false],
    ['أحمد ياسر', 9, 30, true],
    ['علي محمد', 5, 10, false],
    ['سارة علي', 7, 15, true],
    ['مريم أحمد', 4, 5, false],
  ];
  final List<String> ageGroups = ['0-5', '6-10', '11-15', '+16'];
  final List<String> familyMembersNumberGroups = ['1-2', '3-5', '+6'];
  final List<String> orphanReasonGroups = ['وفاة الأم', 'وفاة الأب', 'كلاهما'];
  String? selectedAgeGroup;
  String? selectedFamilyMembersNumberGroup;
  String? selectedOrphanReasonGroup;
  bool? _isDisable;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom AppBar
        CustomAppBar(
          leading: Row(
            children: [
              // الشخص
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 22.5,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              horizontalSpacing(8),
              Text('مرحباً بك', style: font20WhiteBold),
            ],
          ),
          actions: [
            // أيقونة االشات
            GestureDetector(
              child: SvgPicture.asset('assets/svgs/message.svg'),
              onTap: () {
                Navigator.pushNamed(context, Routes.donorChatsScreen);
              },
            ),
            horizontalSpacing(36),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  child: SvgPicture.asset('assets/svgs/notification.svg'),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.notificationScreen);
                  },
                ),
                PositionedDirectional(
                  end: -10.w,
                  top: -15.h,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Text(
                      '4',
                      style: font14BlackMedium.copyWith(color: primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search and filter
                CompositedTransformTarget(
                  link: _layerLink,
                  child: Row(
                    key: _searchFieldKey,

                    children: [
                      Expanded(
                        // البحث
                        child: CustomTextField(
                          horizantal: 8.w,
                          hintText: 'ابحث ...',
                          borderRadius: 4,
                          hintTextStyle: TextStyle(
                            fontFamily: 'Cairo',
                            color: mainGray,
                            fontWeight: FontWeightHeper.medium,
                            fontSize: 14.sp,
                          ),
                          prefixIcon: Icon(Icons.search),
                          textColor: mainBlack,
                          label: '',
                          backgroundColor: lightGray,
                          controller: _searchController,
                        ),
                      ),
                      //زر الفلتر
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(greenColor),
                          minimumSize: WidgetStateProperty.all(Size(36, 36)),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.all(4),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: greenColor),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_filterOverlayEntry == null) {
                            showFloatingFilter();
                          } else {
                            _filterOverlayEntry?.remove();
                            _filterOverlayEntry = null;
                          }
                        },
                        child: SvgPicture.asset('assets/svgs/ic_filter.svg'),
                      ),

                      // DropdownButton<String>(
                      //   icon: Icon(
                      //     Icons.filter_alt,
                      //   ), // أيقونة بدل السهم الافتراضي
                      //   underline: SizedBox(), // لإخفاء الخط السفلي
                      //   items: [
                      //     DropdownMenuItem(value: 'age', child: Text('العمر')),
                      //     DropdownMenuItem(
                      //       value: 'people',
                      //       child: Text('عدد الأفراد'),
                      //     ),
                      //   ],
                      //   onChanged: (value) {
                      //     print('اختيار $value');
                      //   },
                      //   hint: SizedBox.shrink(), // لا يظهر نص ضمن الزر
                      //   // أو ممكن تخلي child أي ويدجت تبغاها بدل النص
                      // ),
                    ],
                  ),
                ),
                verticalSpacing(16.h),
                Text('قائمة الأيتام', style: font20BlackBold),
                // verticalSpacing(16.h),
                // orphan list
                Expanded(
                  child: ListView.builder(
                    itemCount: orphanList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrphanCard(
                        name: orphanList[index][0],
                        age: orphanList[index][1],
                        lastDonation: orphanList[index][2],
                        isdisable: orphanList[index][3],
                        onTap: () {
                          //TODO: send orphan info
                          Navigator.pushNamed(context, Routes.orphanInfoScreen);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
              backgroundColor: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 0.5, color: greenColor),
              ),
              titlePadding: EdgeInsetsDirectional.all(8),
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('فلتر بحسب', style: font20BlackMedium),
                  IconButton(
                    constraints: const BoxConstraints(
                      minHeight: 24,
                      minWidth: 24,
                    ),
                    icon: Icon(Icons.close, color: mainBlack, size: 16),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('العمر', style: font20BlackMedium),
                    verticalSpacing(8),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: ageGroups.map((age) {
                        final bool isSelected = age == selectedAgeGroup;
                        return ChoiceChip(
                          label: Text(age),
                          selected: isSelected,
                          showCheckmark: false,
                          onSelected: (selected) {
                            setState(() {
                              selectedAgeGroup = selected ? age : null;
                              print(selectedAgeGroup);
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(width: 0.5, color: greenColor),
                          ),
                          selectedColor: greenColor,
                          backgroundColor: Colors.white,
                          labelStyle: font14BlackRegular.copyWith(
                            fontSize: 18,
                            color: isSelected ? Colors.white : mainBlack,
                          ),
                        );
                      }).toList(),
                    ),
                    Text('عدد أفراد العائلة', style: font20BlackMedium),
                    verticalSpacing(8),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: familyMembersNumberGroups.map((
                        familyMembersNumber,
                      ) {
                        final bool isSelected =
                            familyMembersNumber ==
                            selectedFamilyMembersNumberGroup;
                        return ChoiceChip(
                          label: Text(familyMembersNumber),
                          selected: isSelected,
                          showCheckmark: false,
                          onSelected: (selected) {
                            setState(() {
                              selectedFamilyMembersNumberGroup = selected
                                  ? familyMembersNumber
                                  : null;
                              print(selectedFamilyMembersNumberGroup);
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(width: 0.5, color: greenColor),
                          ),
                          selectedColor: greenColor,
                          backgroundColor: Colors.white,
                          labelStyle: font14BlackRegular.copyWith(
                            fontSize: 18,
                            color: isSelected ? Colors.white : mainBlack,
                          ),
                        );
                      }).toList(),
                    ),
                    Text('سبب اليتم', style: font20BlackMedium),
                    verticalSpacing(8),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: orphanReasonGroups.map((orphanReason) {
                        final bool isSelected =
                            orphanReason == selectedOrphanReasonGroup;
                        return ChoiceChip(
                          label: Text(orphanReason),
                          selected: isSelected,
                          showCheckmark: false,
                          onSelected: (selected) {
                            setState(() {
                              selectedOrphanReasonGroup = selected
                                  ? orphanReason
                                  : null;
                              print(selectedOrphanReasonGroup);
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(width: 0.5, color: greenColor),
                          ),
                          selectedColor: greenColor,
                          backgroundColor: Colors.white,
                          labelStyle: font14BlackRegular.copyWith(
                            fontSize: 18,
                            color: isSelected ? Colors.white : mainBlack,
                          ),
                        );
                      }).toList(),
                    ),
                    Text('هل يوجد إعاقة؟', style: font20BlackMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RadioListTile<bool>(
                            contentPadding: EdgeInsetsGeometry.zero,

                            title: Transform.translate(
                              offset: Offset(20, 0),
                              child: Text(
                                'نعم',
                                style: font14BlackRegular.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            value: true,
                            groupValue: _isDisable,
                            activeColor: greenColor,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _isDisable = value;
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<bool>(
                            contentPadding: EdgeInsetsGeometry.zero,
                            title: Transform.translate(
                              offset: Offset(20, 0),
                              child: Text(
                                'لا',
                                style: font14BlackRegular.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            value: false,
                            activeColor: greenColor,
                            groupValue: _isDisable,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _isDisable = value;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                CustomElevatedButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'تطبيق',
                  textFontSize: 16,
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showFloatingFilter() {
    final renderBox =
        _searchFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _filterOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 6, // مسافة تحت حقل البحث
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, size.height + 6),
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsetsDirectional.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: greenColor, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('فلتر بحسب', style: font20BlackMedium),
                            IconButton(
                              constraints: const BoxConstraints(
                                minHeight: 24,
                                minWidth: 24,
                              ),
                              icon: Icon(
                                Icons.close,
                                color: mainBlack,
                                size: 16,
                              ),
                              onPressed: () {
                                _filterOverlayEntry?.remove();
                                _filterOverlayEntry = null;
                              },
                            ),
                          ],
                        ),
                        // العمر
                        Text('العمر', style: font20BlackMedium),
                        verticalSpacing(8),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: ageGroups.map((age) {
                            final isSelected = age == selectedAgeGroup;
                            return ChoiceChip(
                              label: Text(age),
                              selected: isSelected,
                              showCheckmark: false,
                              onSelected: (selected) {
                                setState(() {
                                  selectedAgeGroup = selected ? age : null;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 0.5, color: greenColor),
                              ),
                              selectedColor: greenColor,
                              backgroundColor: Colors.white,
                              labelStyle: font14BlackRegular.copyWith(
                                fontSize: 18,
                                color: isSelected ? Colors.white : mainBlack,
                              ),
                            );
                          }).toList(),
                        ),
                        verticalSpacing(12),

                        // عدد الأفراد
                        Text('عدد أفراد العائلة', style: font20BlackMedium),
                        verticalSpacing(8),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: familyMembersNumberGroups.map((num) {
                            final isSelected =
                                num == selectedFamilyMembersNumberGroup;
                            return ChoiceChip(
                              label: Text(num),
                              selected: isSelected,
                              showCheckmark: false,
                              onSelected: (selected) {
                                setState(() {
                                  selectedFamilyMembersNumberGroup = selected
                                      ? num
                                      : null;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 0.5, color: greenColor),
                              ),
                              selectedColor: greenColor,
                              backgroundColor: Colors.white,
                              labelStyle: font14BlackRegular.copyWith(
                                fontSize: 18,
                                color: isSelected ? Colors.white : mainBlack,
                              ),
                            );
                          }).toList(),
                        ),
                        verticalSpacing(12),

                        // سبب اليتم
                        Text('سبب اليتم', style: font20BlackMedium),
                        verticalSpacing(8),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: orphanReasonGroups.map((reason) {
                            final isSelected =
                                reason == selectedOrphanReasonGroup;
                            return ChoiceChip(
                              label: Text(reason),
                              selected: isSelected,
                              showCheckmark: false,
                              onSelected: (selected) {
                                setState(() {
                                  selectedOrphanReasonGroup = selected
                                      ? reason
                                      : null;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(width: 0.5, color: greenColor),
                              ),
                              selectedColor: greenColor,
                              backgroundColor: Colors.white,
                              labelStyle: font14BlackRegular.copyWith(
                                fontSize: 18,
                                color: isSelected ? Colors.white : mainBlack,
                              ),
                            );
                          }).toList(),
                        ),
                        verticalSpacing(12),

                        // إعاقة
                        Text('هل يوجد إعاقة؟', style: font20BlackMedium),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<bool>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'نعم',
                                  style: font14BlackRegular.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                value: true,
                                groupValue: _isDisable,
                                onChanged: (value) {
                                  setState(() {
                                    _isDisable = value;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<bool>(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'لا',
                                  style: font14BlackRegular.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                value: false,
                                groupValue: _isDisable,
                                onChanged: (value) {
                                  setState(() {
                                    _isDisable = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomElevatedButton(
                            onTap: () {
                              _filterOverlayEntry?.remove();
                              _filterOverlayEntry = null;
                            },
                            text: 'تطبيق',
                            textFontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_filterOverlayEntry!);
  }

  // void _showFilterSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true, // عشان يكون الSheet كبير لو بدك
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //           top: 16,
  //           left: 16,
  //           right: 16,
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'فلترة',
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.close),
  //                   onPressed: () =>
  //                       Navigator.of(context).pop(), // إغلاق التبويبة
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 16),

  //             // فلترة العمر (مثال Slider)
  //             Text('العمر: $selectedAge'),
  //             Slider(
  //               min: 0,
  //               max: 100,
  //               divisions: 100,
  //               value: selectedAge.toDouble(),
  //               label: '$selectedAge',
  //               onChanged: (value) {
  //                 setState(() {
  //                   selectedAge = value.toInt();
  //                 });
  //               },
  //             ),

  //             // فلترة عدد الأفراد (مثال Dropdown)
  //             SizedBox(height: 16),
  //             DropdownButton<int>(
  //               value: selectedPeopleCount,
  //               items: List.generate(10, (index) => index + 1)
  //                   .map(
  //                     (e) => DropdownMenuItem<int>(
  //                       value: e,
  //                       child: Text('عدد الأفراد: $e'),
  //                     ),
  //                   )
  //                   .toList(),
  //               onChanged: (val) {
  //                 if (val != null) {
  //                   setState(() {
  //                     selectedPeopleCount = val;
  //                   });
  //                 }
  //               },
  //             ),

  //             SizedBox(height: 24),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // نفذ الفلترة اللي تريدها هنا أو ارجع القيم
  //                 Navigator.of(context).pop(); // أغلق التبويبة
  //                 print(
  //                   'فلترة: العمر $selectedAge وعدد الأفراد $selectedPeopleCount',
  //                 );
  //               },
  //               child: Text('تطبيق الفلترة'),
  //             ),

  //             SizedBox(height: 16),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
