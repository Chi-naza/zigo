import 'package:flutter/material.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/zigo_logo.dart';

class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned(
          //   top: Dimensions.height30,
          //   left: Dimensions.height50,
          //   right: Dimensions.height50,
          //   child: ZigoLogo(
          //     zFontSize: Dimensions.height20*5.5,
          //     textFontSize: Dimensions.height20*2,
          //   ),
          // )
        ],
      ),
    );
  }
}