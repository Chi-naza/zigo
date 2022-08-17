import 'package:flutter/material.dart';
import 'package:zigo/constants/dimensions.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const AppButton({Key? key, required this.text, this.height, this.width, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onTap, 
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width?? Dimensions.width50*2, height?? Dimensions.height20*2),
        ),
      ),
    );
  }
}