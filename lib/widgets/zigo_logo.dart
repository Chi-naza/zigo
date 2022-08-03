import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class ZigoLogo extends StatelessWidget {
  final double? zFontSize;
  final double? textFontSize;
  const ZigoLogo({Key? key, this.zFontSize, this.textFontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // zigo Z logo            
          Text(
            'Z',
            style: GoogleFonts.balsamiqSans(
              color: AppColors.mainColor,
              fontSize: zFontSize?? Dimensions.height50*3,
              // fontWeight: FontWeight.w600,
            ),
          ),
          // zigo text
          Text(
            'ZIGO',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: AppColors.zigoTextBlackColor,
              fontSize: textFontSize?? Dimensions.height30,
              letterSpacing: 5,
            ),
          ),
          // the image
          
        ],
      ),
    );
  }
}