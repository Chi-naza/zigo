import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/screens/Intro/onboarding/intro_screen1.dart';
import 'package:zigo/screens/Intro/onboarding/intro_screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String  routeName = '/zigo-into';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller for the GFIntroScreen slides
  late PageController _pageController;
  // index of current page
  late int initialPage;

  AuthController authController = Get.find();

  // List of onBoarding screens/widgets
  List<Widget> slides() {
    return [
      const IntroScreenOne(),
      const IntroScreenTwo(),
      Container(
      width: Dimensions.screenWidth,
      height: Dimensions.screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Intro3.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2), 
            BlendMode.darken
          ),
        )
      ),
    ),
    ];

  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: GFIntroScreen(
        color:  Colors.grey.shade200, 
        slides: slides(),
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 5,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          backButtonText: 'Previous',
          forwardButtonText: 'Next',
          skipButtonText: 'Skip',
          forwardButtonTextStyle: slideButtonsTextStyle,
          backButtonTextStyle: slideButtonsTextStyle,
          doneButtonTextStyle: slideButtonsTextStyle.copyWith(fontSize: Dimensions.font20-2),
          skipButtonTextStyle: slideButtonsTextStyle,//.copyWith(color: Colors.redAccent),
          pageController: _pageController,
          pageCount: slides().length,
          currentIndex: initialPage,
          // when nextButton is tapped
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          // when previousButton is tapped
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          // when skipButton is tapped
          onSkipTap: () {
            // checking if user is loggedIn
            if(authController.isLoggedIn()){
              authController.navigateToHomeScreen();
            }else{
              authController.navigateToLoginScreen();
            }
          },
          // when goButton is tapped: goes to homeScreen
          onDoneTap: () {
            // checking if user is loggedIn
            if(authController.isLoggedIn()){
              authController.navigateToHomeScreen();
            }else{
              authController.navigateToLoginScreen();
            }
          },
          navigationBarColor: Colors.transparent, //.zigoBackgroundColor,
          showDivider: false,
          inactiveColor: Colors.grey,
          activeColor: AppColors.mainColor,
        ),
      ),
    );
  }

  // A custom style for slide button texts
  TextStyle slideButtonsTextStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.font16,
    color: AppColors.mainColor,
  );


}




