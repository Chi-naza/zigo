import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header.dart';
import 'package:zigo/widgets/shadowed_tile.dart';

class HeaderSection extends StatelessWidget {
  final String headerText;
  final Widget? child;
  final bool useShadowedContBelowDivider;
  final bool extraSpaceAfterHeader;
  
  const HeaderSection({Key? key, required this.headerText, this.child, this.useShadowedContBelowDivider = false, this.extraSpaceAfterHeader = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The main Header: i.e image & menu icon
        Header(),
        SizedBox(height: Dimensions.height20*3), // space btw header and headerSection
        // first widget section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headerText,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.height20,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                    // more . . . icon
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: Dimensions.height20*2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // here's the Divider (wrapped around padding)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
          child: Divider(
            height: Dimensions.height12,
            thickness: Dimensions.height9/8,
            color: AppColors.zigoGreyColor,
          ),
        ),
        if(useShadowedContBelowDivider)
          SizedBox(height: Dimensions.height30),
        // Our ShadowedTile custom widget
        // used when our boolean is set to true. If child is not given, we have an empty textWidget.
       if(useShadowedContBelowDivider)
           ShadowedTile(child: child??Text("")),
        // Extra space after the whole header
        if(extraSpaceAfterHeader)
          SizedBox(height: Dimensions.height30),
      ],
    );
  }
}