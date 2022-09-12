import 'package:flutter/material.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/zigo_logo.dart';

class IntroScreenThree extends StatelessWidget {
  const IntroScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFa7eef1),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash4.png'),
                  fit: BoxFit.fill,
                ),
               ),
              ),
            ),
          // zigo logo
          // Positioned(
          //   top: Dimensions.height50,
          //   left: Dimensions.height50,
          //   right: Dimensions.height50,
          //   child: ZigoLogo(
          //     zFontSize: Dimensions.height20*5.5,
          //     textFontSize: Dimensions.height20*2,
          //   ),
          // ),
        ],
      ),
    );
  }
}