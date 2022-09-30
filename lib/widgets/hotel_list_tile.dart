import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class HotelListTile extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final String hotelLocation;
  final String price;
  final String numOfReviews;
  
  const HotelListTile({Key? key, required this.imagePath, required this.hotelName, required this.hotelLocation, required this.price, required this.numOfReviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50*1.7,
      width: Dimensions.screenWidth - 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius20/4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: AppColors.zigoGreyColor,
            blurRadius: Dimensions.height4,
          ),
        ]
      ),
      // child widget within the shadowed container box
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image
            Container(
              height: double.maxFinite,
              width: Dimensions.width50*1.4,
              margin: EdgeInsets.symmetric(vertical: Dimensions.height4),
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(Dimensions.radius20/4),                 
                image: DecorationImage(                      
                  image: NetworkImage(imagePath),
                  fit: BoxFit.fill,
                ),
              )
            ),
            // hotel & location
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.width50*2,
                  child: Text(
                    hotelName, // hotel name
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      color: AppColors.zigoGreyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font16,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height4),
                Row(                                  
                  children: [
                    Icon(
                      Icons.location_on, // location icon
                      color: AppColors.zigoGreyTextColor,
                      size: Dimensions.font12+2,
                    ),
                    SizedBox(width: Dimensions.height4),
                    Text(
                      hotelLocation,
                      style: GoogleFonts.montserrat(
                        color: AppColors.zigoGreyTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font12-2,
                      ),
                    ),
                  ],
                ),
              ], 
            ),
            // stars & rating
            Row(
              children: List.generate(
                //generate items(widgets)
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.starColor,
                  size: Dimensions.height9,
                ),
              ),
            ),
            // Price & review Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price, //price
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font16-2,
                  ),
                ),
                SizedBox(height: Dimensions.height4),
                Row(                                  
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.zigoGreyTextColor,
                      size: Dimensions.font12+2,
                    ),                            
                    Container(
                      width: Dimensions.width50,
                      child: Text(
                        '$numOfReviews Reviews',
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                          color: AppColors.zigoGreyTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.height9,
                        ),
                      ),
                    ),
                  ],
                ),
              ], 
            ),
          ],
        ),
      ),
    );
  }
}