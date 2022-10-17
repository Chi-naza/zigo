import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class TitleAndDetailTexts extends StatelessWidget {
  final String title;
  final String? detailText;

  const TitleAndDetailTexts({ Key? key, required this.title, this.detailText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Dimensions.width50*2,
          // color: Colors.red,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.height10,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height4),
        Container(
          // color: Colors.red,
          width: Dimensions.width50*2,
          child: Text(
            detailText??'',
            style: GoogleFonts.poppins(
              color: AppColors.zigoGreyTextColor,
              fontSize: Dimensions.height10,
            ),
          ),
        ),
      ],
    );
  }
}