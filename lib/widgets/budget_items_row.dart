import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class BudgetItemRow extends StatelessWidget {
  final int itemNumber;
  final String itemName;
  final String itemPrice;
  
  const BudgetItemRow({Key? key, required this.itemNumber, required this.itemName, required this.itemPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // text with number
            Text(
              '  $itemNumber.',
              style: GoogleFonts.montserrat(),
            ),
            // items beside the number in a row
            Container(
              padding: EdgeInsets.only(left: Dimensions.width9),
              width: Dimensions.screenWidth*0.9,
              height: Dimensions.height50,
              // color: Colors.amber,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // text Item Name
                  Container(
                    width: Dimensions.width50*3,
                    // color: Colors.green,
                    child: Text(
                      itemName,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                      ),
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
                  Container(
                    width: Dimensions.width50*2,
                    // color: Colors.red,
                    child: Text(
                      itemPrice,

                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Divider section
        Divider(
          thickness: Dimensions.height9/8,
          color: AppColors.zigoGreyColor,
          endIndent: Dimensions.width20,
          indent: Dimensions.width20,
        ),
      ],
    );
  }
}