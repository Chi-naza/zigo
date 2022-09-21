import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/budget_controller.dart';
import 'package:zigo/models/budget_items_model.dart';
import 'package:zigo/widgets/budget_items_row.dart';
import 'package:zigo/widgets/header/header_section.dart';

class BudgetDetails extends StatelessWidget {
  final List<BudgetItemsModel> myBudgetItemsList;
  final String budgetName;
  final String totalAmount;

  const BudgetDetails({Key? key, required this.myBudgetItemsList, required this.budgetName, required this.totalAmount}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              headerText: budgetName, // budgetName on header
              useShadowedContBelowDivider: true,
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: myBudgetItemsList.length,
              itemBuilder: ((context, index) {
                var item = myBudgetItemsList[index];
                return BudgetItemRow(
                  itemNumber: index + 1, 
                  itemName: item.itemName, 
                  itemPrice: item.itemPrice,
                );
              }),
            ),
            SizedBox(height: Dimensions.height15),
            // Container(
            //   width: double.infinity,
            //   height: Dimensions.height50*6,
            //   child: MediaQuery.removePadding(
            //     context: context,
            //     removeTop: true,
            //     removeRight: true,
            //     child: ListView.builder(
            //       itemCount: 7,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: EdgeInsets.all(0.0),
            //           child: Row(
            //             children: [
            //               // text with number
            //               Text(
            //                 '  1.',
            //                 style: GoogleFonts.montserrat(),
            //               ),
            //               // items beside the number in a row
            //               Container(
            //                 padding: EdgeInsets.only(left: Dimensions.width9),
            //                 width: Dimensions.screenWidth - 100,
            //                 height: Dimensions.height20*2,
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     // text ITEM
            //                     Text(
            //                       'CROAKER FISH',
            //                       style: GoogleFonts.montserrat(
            //                         fontWeight: FontWeight.bold,
            //                         color: AppColors.zigoGreyTextColor,
            //                       ),
            //                     ),
            //                     // Vertical divider
            //                     VerticalDivider(
            //                       color: AppColors.zigoGreyColor,
            //                       thickness: Dimensions.height9/7,
            //                       indent: Dimensions.height9,
            //                       endIndent: Dimensions.height9,
            //                     ),
            //                     // price
            //                     Text(
            //                       '5,000.23',
            //                       style: GoogleFonts.montserrat(
            //                         fontWeight: FontWeight.bold,
            //                         color: AppColors.zigoGreyTextColor,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),          
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
                    '₦$totalAmount', // total budget amount
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