import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/route_helper.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/reservations.dart';
import 'package:zigo/screens/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zigo',
      // routes
      // getPages: AppRoutes.routes,
      theme: ThemeData(
        // fontFamily: 'Montserrat',
        primarySwatch: buildMaterialColor(Color(0xFF0A71DE)),
      ),
      home: Reservations(),
    );
  }
}


