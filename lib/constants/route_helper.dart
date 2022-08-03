import 'package:get/get.dart';
import 'package:zigo/screens/home/zigo_home.dart';

class Routes {

  static const String home = '/';
  static const String splashScreen = '/splash-screen';

  static String getHome() => '$home';
  static String getSplashScreen() => '$splashScreen';



  static List<GetPage> routes = [
    // for home screen
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn
    ),

    // for splash screen
    // GetPage(
    //   name: splashScreen,
    //   page:,
    // ),
  ];

}