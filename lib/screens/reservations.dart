import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header_section.dart';
import 'package:zigo/widgets/shadowed_tile.dart';
import 'package:zigo/widgets/small_text_n_divider.dart';

class Reservations extends StatelessWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // The header
            HeaderSection(headerText: 'RESERVATIONS'),
           // Accordion one
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: GFAccordion(
                expandedIcon: Icon(Icons.remove, color: AppColors.zigoGreyTextColor),
                collapsedIcon: Icon(Icons.add, color: AppColors.zigoGreyTextColor),
                titleBorder: Border.all(width: 3, color: AppColors.zigoGreyTextColor),
                titleBorderRadius: BorderRadius.circular(Dimensions.radius20/4),
                titlePadding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height15),
                titleChild: Text(
                  'ACCOMMODATION',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                contentChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // hotels
                    SmallTextAndDivider(text: 'Hotels'),                
                    // hotels
                    SmallTextAndDivider(text: 'AirBnB'),                
                    // hotels
                    SmallTextAndDivider(text: 'Short Let'),                
                    // hotels
                    SmallTextAndDivider(text: 'Cabins'),                
                    // hotels
                    SmallTextAndDivider(text: 'Others', wantDivider: false),                
                  ],
                ),
              ),
            ),
           // Accordion two
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: GFAccordion(
                expandedIcon: Icon(Icons.remove, color: AppColors.zigoGreyTextColor),
                collapsedIcon: Icon(Icons.add, color: AppColors.zigoGreyTextColor),
                titleBorder: Border.all(width: 3, color: AppColors.zigoGreyTextColor),
                titleBorderRadius: BorderRadius.circular(Dimensions.radius20/4),
                titlePadding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height15),
                titleChild: Text(
                  'TRANSPORTATION',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                contentChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // hotels
                    SmallTextAndDivider(text: 'Flight'),                
                    // hotels
                    SmallTextAndDivider(text: 'Taxi'),                
                    // hotels
                    SmallTextAndDivider(text: 'Car Lease'),                
                    // hotels
                    SmallTextAndDivider(text: 'Ship Cruise'),                
                    // hotels
                    SmallTextAndDivider(text: 'Train', wantDivider: false),                
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            //(with our custom widget)
            // tour guide
            ShadowedTile(
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20),
                child: Text(
                  'TOUR GUIDE',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // events ticket
            ShadowedTile(
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20),
                child: Text(
                  'EVENTS TICKET',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // restaurant
            ShadowedTile(
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20),
                child: Text(
                  'RESTAURANTS',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height50),
          ],
        ),
      ),
    );
  }
}