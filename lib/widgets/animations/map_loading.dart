import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class MapLoadingAnimation extends StatelessWidget {
  const MapLoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LottieBuilder.asset('assets/animations/mapanimation.json')
      ),
    );
  }
}