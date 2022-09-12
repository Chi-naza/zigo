import 'package:get/get.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/Intro/splash_screen.dart';
import 'package:zigo/screens/home/zigo_home.dart';
import 'package:zigo/screens/reservations.dart';

class AppRoutes {


  static List<GetPage> routes = [
    // for home screen
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fadeIn
    ),
    
    // onboarding screen
    GetPage(
      name: OnboardingScreen.routeName,
      page: () => OnboardingScreen(),
    ),

    // reservations: home
    GetPage(
      name: Reservations.routeName,
      page: () => Reservations(),
    ),
  ];

}