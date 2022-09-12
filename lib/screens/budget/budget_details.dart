import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header/header_section.dart';

class BudgetDetails extends StatelessWidget {
  const BudgetDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              headerText: 'Grocery Budget', 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // text ITEM
                    Text(
                      'ITEM',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                        letterSpacing: 2,
                      ),
                    ),
                    // Vertical divider
                    VerticalDivider(
                      color: AppColors.zigoGreyColor,
                      thickness: Dimensions.height9/7,
                      indent: Dimensions.height16,
                      endIndent: Dimensions.height16,
                    ),
                    // price
                    Text(
                      'PRICE',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ), // end of headSection
            // List View Builder for the Details
            Container(
              width: double.infinity,
              height: Dimensions.height50*6,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeRight: true,
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          // text with number
                          Text(
                            '  1.',
                            style: GoogleFonts.montserrat(),
                          ),
                          // items beside the number in a row
                          Container(
                            padding: EdgeInsets.only(left: Dimensions.width9),
                            width: Dimensions.screenWidth - 100,
                            height: Dimensions.height20*2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // text ITEM
                                Text(
                                  'CROAKER FISH',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.zigoGreyTextColor,
                                  ),
                                ),
                                // Vertical divider
                                VerticalDivider(
                                  color: AppColors.zigoGreyColor,
                                  thickness: Dimensions.height9/7,
                                  indent: Dimensions.height9,
                                  endIndent: Dimensions.height9,
                                ),
                                // price
                                Text(
                                  '5,000.23',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.zigoGreyTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),          
            // Total text and Amount in a Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total
                  Text(
                    'Total',
                    style: GoogleFonts.montserrat(
                      color: AppColors.zigoTextBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.font20-2,                         
                    ),
                  ),
                  // Amount
                  Text(
                    '16,000',
                    style: GoogleFonts.montserrat(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.font20-2,                         
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height50*3), // Space at the bottom of the page
          ],
        ),
      ),
    );
  }
}