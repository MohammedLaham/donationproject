import 'package:donationproject/view/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: '1'.tr,
      locale: controller.language,
      theme: controller.appTheme,
      home: SignIn(),
      // initialBinding: InitialBindings(),
      // routes: routes,
      // getPages: routes,
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Donation App',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   home: SignIn(),
    // );
  }
}
