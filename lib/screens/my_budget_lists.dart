import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header_section.dart';

class MyBudgetListScreen extends StatelessWidget {
  const MyBudgetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height20),
            HeaderSection(
              headerText: 'BUDGET PLANNER', 
              // row child within the container box
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CREATE BUCKET",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColorLight2,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: AppColors.mainColorLight1,
                      size: Dimensions.radius20*1.4,
                    )
                  ],
                ), 
              ),
            ),
            // My budgets section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
              child: Row(
                children: [
                  Text(
                    "My Budgets",
                    style: GoogleFonts.montserrat(
                      color: AppColors.zigoTextBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: Dimensions.width12),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: Dimensions.height9/8,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // Obudu cattle ranch section
            Container(
              height: Dimensions.screenHeight,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width30, vertical: Dimensions.width10),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Obudu cattle . . . text
                                Text(
                                  "OBUDU CATTLE RANCH",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.zigoTextBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: Dimensions.height10),
                                // date
                                Text(
                                  "10/28/22",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.zigoTextBlackColor,
                                  ),
                                ),
                              ],
                            ),
                            // On the Row: more . . . icon
                            Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                              size: Dimensions.height20*1.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
        ),
      ),
      // Floating Action Button section
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null, 
        tooltip: 'click to add',
        hoverColor: AppColors.mainColorLight1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20/2)
        ),
        // the custom widget in the floating action button
        label: Row(
          children: [
            Text(
              "CREATE BUCKET",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: AppColors.mainWhiteColor,
              ),
            ),
            SizedBox(width: Dimensions.width9),
            Icon(
              Icons.add,
              color: AppColors.mainWhiteColor,
              size: Dimensions.radius20*1.4,
            )
          ],
        ),
      ),
    );
  }
}