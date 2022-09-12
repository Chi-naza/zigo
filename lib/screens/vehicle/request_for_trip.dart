import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header/header_section.dart';


class RequestForTrip extends StatelessWidget {
  const RequestForTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            // FollowUP Container after the curved Container in the stack
            Container(
              height: Dimensions.height50*5,
              width: Dimensions.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // The Circular Picture 
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height50*2),
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      // foregroundImage: AssetImage('assets/images/splash23.png'),
                      radius: Dimensions.radius30*2.2,
                    ),
                  ),
                  // Column for Details (wrapped with Container)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row of texts
                        Row(
                          children: [
                            Text(
                              'CHIBUIKE ',
                              style: GoogleFonts.poppins(
                                color: AppColors.zigoGreyTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font23,
                              ),
                            ),
                            Text(
                              'Chika Levi',
                              style: GoogleFonts.poppins(
                                color: AppColors.zigoGreyTextColor,
                                fontSize: Dimensions.font23,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height4),
                        // 154 Trips Text
                        Text(
                          '154 Trips',
                          style: GoogleFonts.poppins(
                            color: AppColors.zigoGreyTextColor,
                            fontSize: Dimensions.font20-2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: Dimensions.height4),
                        // stars & rating
                        Row(
                          children: List.generate(
                            //generate items(widgets)
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.starColor,
                              size: Dimensions.height18,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.height4),
                        // Toyota. . .  text
                        Text(
                          'TOYOTA Yaris',
                          style: GoogleFonts.poppins(
                            color: AppColors.zigoGreyTextColor,
                            fontSize: Dimensions.font16-2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
                        // Request Trip BUTTON
                        AppButton(
                          text: 'Request Trip',
                          width: Dimensions.width50*4.3,
                          onTap: (){},
                        ),
                      ],
                    ),
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