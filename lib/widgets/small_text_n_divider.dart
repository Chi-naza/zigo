import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class SmallTextAndDivider extends StatelessWidget {
  final String text;
  final bool wantDivider;

  const SmallTextAndDivider({Key? key, required this.text, this.wantDivider = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
           child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: AppColors.zigoGreyTextColor,
              fontWeight: FontWeight.bold
            ),
          ),
         ),
        // divider
        if(wantDivider)
          Divider(
            height: Dimensions.height12,
            thickness: Dimensions.height9/8,
            color: AppColors.zigoGreyColor,
          ),
        SizedBox(height: Dimensions.height10),
      ],
    );
  }
}