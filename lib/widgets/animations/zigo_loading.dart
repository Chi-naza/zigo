import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class ZigoLoading extends StatelessWidget {
  const ZigoLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LottieBuilder.asset('assets/animations/98431-loading-animation.json')
      ),
    );
  }
}