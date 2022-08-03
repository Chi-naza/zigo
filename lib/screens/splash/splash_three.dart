import 'package:flutter/material.dart';
import 'package:zigo/constants/dimensions.dart';

class SplashScreenThree extends StatelessWidget {
  const SplashScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash3.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}