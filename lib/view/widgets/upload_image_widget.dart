import 'package:donationproject/core/color/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImageWidget extends StatefulWidget {
  final String title;
  final VoidCallback? onUploadComplete;

  const UploadImageWidget({
    super.key,
    required this.title,
    this.onUploadComplete,
  });
  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  Color _backgroundColor = Colors.green;

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true;
    });

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    await Future.delayed(Duration(seconds: 1)); // لمحاكاة وقت الرفع (اختياري)

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _backgroundColor = grayColor;
      });

      if (widget.onUploadComplete != null) {
        widget.onUploadComplete?.call();
      }
    }


    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _pickImage,
          child: DottedBorder(

            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _isLoading
                  ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
                  : _image == null
                  ?  Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      '46'.tr,
                      style: TextStyle(
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
         Text(
          '47'.tr,
          style: TextStyle(fontSize: 12, color: Colors.green),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}

// import 'dart:ui' as BorderType;
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class UploadImageWidget extends StatefulWidget {
//   final String title;
//
//   const UploadImageWidget({super.key, required this.title});
//
//   @override
//   State<UploadImageWidget> createState() => _UploadImageWidgetState();
// }
//
// class _UploadImageWidgetState extends State<UploadImageWidget> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 20),
//
//         Text(
//           widget.title,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           textDirection: TextDirection.rtl,
//         ),
//         const SizedBox(height: 10),
//         GestureDetector(
//           onTap: _pickImage,
//           child: DottedBorder(
//
//             child: Container(
//               width: double.infinity,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: _image == null
//                   ? Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.upload, color: Colors.white),
//                     SizedBox(width: 8),
//                     Text(
//                       'Upload the image',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               )
//                   : ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.file(
//                   _image!,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 100,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           'Maximum image upload size is 2 GB',
//           style: TextStyle(fontSize: 12, color: Colors.green),
//           textDirection: TextDirection.rtl,
//         ),
//       ],
//     );
//   }
// }
