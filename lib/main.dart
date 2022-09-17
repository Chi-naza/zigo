import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/bindings/initial_bindings.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/route_helper.dart';
import 'package:zigo/firebase_options.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/budget/plan_your_budget_screen.dart';
import 'package:zigo/screens/reservations.dart';
import 'package:zigo/screens/test.dart';

import 'screens/auth/signIn.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      getPages: AppRoutes.routes,
      theme: ThemeData(
        // fontFamily: 'Montserrat',
        primarySwatch: buildMaterialColor(const Color(0xFF0A71DE)),
      ),
      // home: PlanYourBudgetScreen(),
    );
  }
}


