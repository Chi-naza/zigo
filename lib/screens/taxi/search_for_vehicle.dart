import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header/header_section.dart';


class SearchForVehicle extends StatelessWidget {
  const SearchForVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            HeaderSection(headerText: 'BOOK TAXI', extraSpaceAfterHeader: false),
            // Stack for the Map image and the curved Container
            Stack(
              children: [
                Container(
                  width: Dimensions.screenWidth,
                  height: Dimensions.height50*7.1,
                  decoration: BoxDecoration(                  
                    color:Colors.grey.withOpacity(0.3),
                    image: const DecorationImage(                      
                      image: AssetImage('assets/images/map1.png'),
                      fit: BoxFit.fill,
                    ),
                  )
                ),
                // Curved Container in the Stack: positioned  at the bottom of the stack
                Positioned(
                  top: Dimensions.height50*6.6,
                  child: Container(
                    height: Dimensions.height30,
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius30),
                        topRight: Radius.circular(Dimensions.radius30),
                      ),
                    ),
                  ),
                ),            
              ],
            ),
            // FollowUP Container after the stack
            Container(
              height: Dimensions.height50*5,
              width: Dimensions.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              color: Colors.white,         
              child: Column(
                children: [
                  // Column: From Text & TextField
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From TEXT
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width12),
                        child: Text(
                          'From',
                          style: GoogleFonts.montserrat(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font26/2,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height4),
                      Container(
                        height: Dimensions.height20*2,
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.zigoBackgroundColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                        ),            
                        child: Row(
                          children: [
                            SizedBox(width: Dimensions.width10),
                            // the input field
                            Expanded(
                              child: TextField(
                                expands: true,
                                maxLines: null,                                                                               
                                decoration: InputDecoration(
                                  hintText: 'Current location',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: AppColors.zigoGreyTextColor,                                          
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),      
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  // Column: 'To' Text & TextField
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From TEXT
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width12),
                        child: Text(
                          'To',
                          style: GoogleFonts.montserrat(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font26/2,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height4),
                      Container(
                        height: Dimensions.height20*2,
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.zigoBackgroundColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                        ),            
                        child: Row(
                          children: [
                            SizedBox(width: Dimensions.width10),
                            // the input field
                            Expanded(
                              child: TextField(
                                expands: true,
                                maxLines: null,                                                                               
                                decoration: InputDecoration(
                                  hintText: 'Enter Destination',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: AppColors.zigoGreyTextColor,                                          
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),      
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  // ROW for N0. of Persons, Luggage, & Search Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // N0. of Persons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // From TEXT
                          Container(                            
                            child: Text(
                              'No. of Persons',
                              style: GoogleFonts.montserrat(
                                color: AppColors.zigoGreyTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font26/2,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          Container(
                            height: Dimensions.height20*2,
                            width: Dimensions.width50*2,
                            decoration: BoxDecoration(
                              color: AppColors.zigoBackgroundColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                            ),            
                            child: Row(
                              children: [
                                SizedBox(width: Dimensions.width10),
                                // the input field
                                Expanded(
                                  child: TextField(
                                    expands: true,
                                    maxLines: null,                                                                               
                                    decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: GoogleFonts.montserrat(
                                        color: AppColors.zigoGreyTextColor,                                          
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),      
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Luggages
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // From TEXT
                          Container(                            
                            child: Text(
                              'Luggages',
                              style: GoogleFonts.montserrat(
                                color: AppColors.zigoGreyTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font26/2,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          Container(
                            height: Dimensions.height20*2,
                            width: Dimensions.width50*2,
                            decoration: BoxDecoration(
                              color: AppColors.zigoBackgroundColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                            ),            
                            child: Row(
                              children: [
                                SizedBox(width: Dimensions.width10),
                                // the input field
                                Expanded(
                                  child: TextField(
                                    expands: true,
                                    maxLines: null,                                                                               
                                    decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: GoogleFonts.montserrat(
                                        color: AppColors.zigoGreyTextColor,                                          
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),      
                              ],
                            ),
                          ),
                        ],
                      ),
                      // the SEARCH BUTTON
                      Column(
                        children: [
                          Text(""), // to balance the button on the row
                          AppButton(text: "Search", onTap: (){}),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}