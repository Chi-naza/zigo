import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class HeaderSection extends StatelessWidget {
  final String headerText;
  final Widget child;
  
  const HeaderSection({Key? key, required this.headerText, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.height20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // hamburger icon 
              Icon(
                Icons.menu,
                size: Dimensions.height50*1.2,
                color: AppColors.zigoGreyColor,
              ),
              //profile image
              CircleAvatar(
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),// will fall back to this if foreground is wrong/null
                // foregroundImage: AssetImage('assets/images/splash23.png'),
                radius: Dimensions.radius30,
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height20*4),
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
        SizedBox(height: Dimensions.height30),
        // Container box with shadow. Enhanced with padding
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
          child: Container(
            height: Dimensions.height20*3,
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
            // row child within the shadowed container box
            child: child,
          ),
        ),
        // Extra space after the whole header
        SizedBox(height: Dimensions.height30),
      ],
    );
  }
}