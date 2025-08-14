// // OrphanInfoScreen.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../core/color/constant.dart';
// import '../widgets/button.dart';
// import '../widgets/custom_textfield.dart';
//
// class OrphanInfoScreen extends StatefulWidget {
//   const OrphanInfoScreen({super.key});
//   @override
//   State<OrphanInfoScreen> createState() => _OrphanInfoScreenState();
// }
//
// class _OrphanInfoScreenState extends State<OrphanInfoScreen> {
//   // ---------- image files ----------
//   File? _personalPhoto;
//   File? _birthCertificate;
//   File? _deathCertificate;
//
//   final ImagePicker _picker = ImagePicker();
//
//   /* Show a bottom‑sheet giving Camera / Gallery options,
//      then call the callback with the selected File. */
//   Future<void> _pickImage(BuildContext ctx, void Function(File) onSelected) async {
//     await showModalBottomSheet(
//       context: ctx,
//       builder: (_) => SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera_alt),
//               title: const Text('Take Photo'),
//               onTap: () async {
//                 final picked = await _picker.pickImage(source: ImageSource.camera);
//                 if (picked != null) onSelected(File(picked.path));
//                 Navigator.pop(ctx);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Choose from Gallery'),
//               onTap: () async {
//                 final picked = await _picker.pickImage(source: ImageSource.gallery);
//                 if (picked != null) onSelected(File(picked.path));
//                 Navigator.pop(ctx);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Re‑usable upload row with preview thumbnail
//   Widget _buildUploadRow({
//     required String label,
//     required File? file,
//     required VoidCallback onPick,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         textDirection: TextDirection.ltr,      // ← forces visual L‑>R
//         children: [
//           // ----- left side: label + icon -----
//           GestureDetector(
//             onTap: onPick,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(label,
//                     style: const TextStyle(fontSize: 15, color: Colors.black)),
//                 SizedBox(width: 150,),
//                 const Icon(Icons.photo, color: Colors.black87),
//
//               ],
//             ),
//           ),
//           const Spacer(),
//           // ----- right side: preview thumbnail -----
//           if (file != null)
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: Image.file(
//                 file,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text('18'.tr,
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              _FieldLabel('20'.tr),
//              CustomTextField(label: 'MM/DD/YYYY'),
//
//              _FieldLabel('22'.tr),
//              CustomTextField(label: '51'.tr),
//
//              _FieldLabel('52'.tr),
//              CustomTextField(label: '', vertical: 60, horizantal: 16),
//
//              _FieldLabel('53'.tr),
//             const CustomTextField(label: '', vertical: 60, horizantal: 16),
//
//              _FieldLabel('21'.tr),
//              CustomTextField(label: '21'.tr),
//
//              _FieldLabel('54'.tr),
//              CustomTextField(label: '55'.tr),
//
//              _FieldLabel('56'.tr),
//              CustomTextField(label: '57'.tr),
//
//             const _FieldLabel('Education Details'),
//             const CustomTextField(label: '', vertical: 60, horizantal: 16),
//
//             const SizedBox(height: 16),
//             const Text('Upload Documents',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
//
//             // --------- upload rows -----------
//             _buildUploadRow(
//               label: 'Upload Personal Photo',
//               file: _personalPhoto,
//               onPick: () => _pickImage(context, (f) => setState(() => _personalPhoto = f)),
//             ),
//             _buildUploadRow(
//               label: 'Upload Birth Certificate',
//               file: _birthCertificate,
//               onPick: () => _pickImage(context, (f) => setState(() => _birthCertificate = f)),
//             ),
//             _buildUploadRow(
//               label: 'Upload Death Certificate',
//               file: _deathCertificate,
//               onPick: () => _pickImage(context, (f) => setState(() => _deathCertificate = f)),
//             ),
//
//             const SizedBox(height: 24),
//             Center(
//               child: Button(
//                 text: 'Submit',
//                 onPressed: () {
//                 },
//                 backgr: primaryColor,
//                 color: Colors.white,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 borderRadius: 20,
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// simple bold label widget
// class _FieldLabel extends StatelessWidget {
//   final String text;
//   const _FieldLabel(this.text);
//   @override
//   Widget build(BuildContext context) => Padding(
//     padding: const EdgeInsets.only(top: 12, bottom: 4),
//     child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
//   );
// }
