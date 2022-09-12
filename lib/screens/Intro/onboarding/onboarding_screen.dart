import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/screens/Intro/onboarding/intro_screen1.dart';
import 'package:zigo/screens/Intro/onboarding/intro_screen2.dart';
import 'package:zigo/screens/reservations.dart';

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

  // List of onBoarding screens/widgets
  List<Widget> slides() {
    return [
      IntroScreenOne(),
      IntroScreenTwo(),
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
    _pageController = PageController(initialPage: 2);
    initialPage = _pageController.initialPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: GFIntroScreen(
        color:  Colors.white, //AppColors.zigoBackgroundColor,
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
          skipButtonTextStyle: slideButtonsTextStyle.copyWith(color: Colors.redAccent),
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
            //TODO: check if user is signedIn
            Get.offAllNamed(Reservations.routeName);
          },
          // when goButton is tapped: goes to homeScreen
          onDoneTap: () {
            //TODO: check if user is signedIn
            Get.offAllNamed(Reservations.routeName);
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




