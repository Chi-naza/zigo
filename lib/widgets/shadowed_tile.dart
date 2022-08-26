import 'package:flutter/material.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class ShadowedTile extends StatelessWidget {
  final Widget child;
  final double? height;
  
  const ShadowedTile({Key? key, required this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
      child: Container(
        height: height??Dimensions.height20*3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20/4),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: AppColors.zigoGreyColor,
              blurRadius: Dimensions.height4,
            ),
          ]
        ),
        // child widget within the shadowed container box
        child: child,
      ),
    );
  }
}