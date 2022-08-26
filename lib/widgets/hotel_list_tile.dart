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
      height: Dimensions.height50*1.6,
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
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              )
            ),
            // hotel & location
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hotelName,
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20-3,
                  ),
                ),
                SizedBox(height: Dimensions.height4),
                Row(                                  
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.zigoGreyTextColor,
                    ),
                    Text(
                      hotelLocation,
                      style: GoogleFonts.montserrat(
                        color: AppColors.zigoGreyTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font12,
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
                  size: Dimensions.height12,
                ),
              ),
            ),
            // Price & review Text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20-1,
                  ),
                ),
                SizedBox(height: Dimensions.height4),
                Row(                                  
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.zigoGreyTextColor,
                    ),                            
                    Text(
                      '$numOfReviews Reviews',
                      style: GoogleFonts.montserrat(
                        color: AppColors.zigoGreyTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font12,
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