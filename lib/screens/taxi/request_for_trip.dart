import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header/header_section.dart';


class RequestForTrip extends StatelessWidget {
  const RequestForTrip({Key? key}) : super(key: key);

  static const String routeName = '/request-for-trip';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
             //header
            const HeaderSection(headerText: 'BOOK TAXI', extraSpaceAfterHeader: false),
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
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/images/avatar.jpg'),//NetworkImage(controller.taxiDetailsList[0].driverImage), // driver image
                      radius: Dimensions.radius30*2,
                    ),
                  ),
                  // Column for Details (wrapped with Container)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width9),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row of texts
                        Row(
                          children: [
                            Container(
                              width: Dimensions.width50*2.5,
                              child: Text(
                                'LastName',//'${controller.taxiDetailsList[0].driverLastName.toUpperCase()} ',
                                // overflow: TextOverflow,
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font20,
                                ),
                              ),
                            ),
                            SizedBox(width:Dimensions.width4),
                            Container(
                              width: Dimensions.width50*2,
                              child: Text(
                                'Firstname',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontSize: Dimensions.font16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height4),
                        // 154 Trips Text
                        Text(
                          '234 Trips', //'${controller.taxiDetailsList[0].noOfTripsTaken} Trips',  // no. of trips taken
                          style: GoogleFonts.poppins(
                            color: AppColors.zigoGreyTextColor,
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: Dimensions.height4),
                        // stars & rating
                        Row(
                          children: List.generate(
                            //generate items(widgets)
                            4, //int.parse(controller.taxiDetailsList[0].rating),
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.starColor,
                              size: Dimensions.height16,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.height4),
                        // Toyota. . .  text
                        Text(
                          'Venza PR', //controller.taxiDetailsList[0].carName,  // car name
                          style: GoogleFonts.poppins(
                            color: AppColors.zigoGreyTextColor,
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
                        // Request Trip BUTTON
                        AppButton(
                          text: 'Request Trip',
                          width: Dimensions.width50*4,
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