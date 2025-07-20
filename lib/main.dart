import 'package:donationproject/core/routing/routes.dart';
import 'package:donationproject/view/screens/donor/donor_main_screen.dart';
import 'package:donationproject/view/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // screen utils for responsive design
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.donorMainScreen,
        routes: {
          Routes.donorMainScreen: (context) => const DonorMainScreen(),
          Routes.signInScreen: (context) => const SignIn(),
          // Add other routes here
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
