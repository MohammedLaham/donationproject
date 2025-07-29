import 'package:donationproject/constant.dart';
import 'package:donationproject/view/widgets/custom_elevated_button.dart';
import 'package:donationproject/view/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin Helpers {
  Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    required String confirmButtonText,
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: font16BlackBold,
          ),

          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
          content: content,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  child: CustomElevatedButton(
                    btn_height: 40.h,
                    textFontSize: 16,
                    text: confirmButtonText,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  child: CustomOutlineButton(
                    btn_height: 40.h,
                    textFontSize: 16,
                    text: 'إلغاء الأمر',
                    onTap: () => Navigator.pop(context),
                    borderColor: Colors.red,
                    textColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],

          // actions: [
          //   Row(
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: CustomElevatedButton(
          //           btn_height: 40.h,
          //           textFontSize: 16,
          //           text: 'تسجيل الخروج',
          //           onTap: () {
          //             Navigator.pop(context);
          //             // onConfirm();
          //           },
          //         ),
          //         // ElevatedButton(
          //         //   onPressed: () {
          //         //     Navigator.pop(context);
          //         //     onConfirm();
          //         //   },
          //         //   style: ElevatedButton.styleFrom(
          //         //     backgroundColor: Colors.green,
          //         //   ),
          //         //   child: Text(
          //         //     confirmButtonText,
          //         //     style: font16BlackBold.copyWith(color: Colors.white),
          //         //   ),
          //         // ),
          //       ),
          //       SizedBox(width: 16.w),
          //       Expanded(
          //         child: CustomOutlineButton(
          //           btn_height: 40.h,
          //           textFontSize: 16,
          //           text: 'إلغاء الأمر',
          //           onTap: () => Navigator.pop(context),
          //           borderColor: Colors.red,
          //           textColor: Colors.red,
          //           // textFontSize: 16,
          //         ),
          //         // OutlinedButton(
          //         //   onPressed: () => Navigator.pop(context),
          //         //   style: OutlinedButton.styleFrom(
          //         //     side: BorderSide(color: Colors.red),
          //         //     foregroundColor: Colors.red,
          //         //   ),
          //         //   child: Text('إلغاء الأمر'),
          //         // ),
          //       ),
          //     ],
          //   ),
          // ],
        );
      },
    );
  }
}
