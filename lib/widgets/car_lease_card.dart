import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';

class CarLeaseCard extends StatelessWidget {
  final String city;
  final String vehicleName;
  final String modelYear;
  final String price;
  final String vehicleImagePath;
  final Function()?  onTap;

  const CarLeaseCard({Key? key, required this.city, required this.vehicleName, required this.modelYear, required this.price, required this.vehicleImagePath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50*4,
      width: Dimensions.screenWidth - 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.zigoBackgroundColor2,
            AppColors.mainWhiteColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(color:AppColors.zigoBackgroundColor2, width: Dimensions.width4/2),
        borderRadius: BorderRadius.circular(Dimensions.radius15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
        child: Column(
          children: [
            // Location Text in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                // city/Location
                Text(
                  city,
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font16,
                  ),
                ),
              ],
            ),
            // The Big Text ... ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Big Text: Vehicle Name
                    Text(
                      vehicleName,
                      style: GoogleFonts.montserrat(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font26,
                      ),
                    ),
                    SizedBox(width: Dimensions.width4/2),
                    // year
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // model Year of vehicle
                        Text(
                          modelYear,
                          style: GoogleFonts.montserrat(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                        // gap text
                        Text(""),
                      ],
                    ),
                  ],
                ),
                // Gap text in the row
                Text(""),
              ],
            ),
            SizedBox(height: Dimensions.height4),
            // ROW: Containing (seats, pump, amount, button) & Car/Vehicle
            Row(
              children: [
                // COLUMN: Containing (seats, pump, amount, button)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW: No. pf SEATS & GAS PUMP
                    Row(
                      children: [
                        // seats
                        Row(
                          children: [
                            // seat image
                            Icon(
                              Icons.airline_seat_recline_normal,
                              color: AppColors.zigoGreyTextColor,
                            ),                            
                            SizedBox(width: Dimensions.width4/2),
                            // seat text
                            Text(
                              '4 Seats',
                              style: GoogleFonts.montserrat(
                                color: AppColors.zigoGreyTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font12+2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: Dimensions.width9),
                        // Gas Pump
                        Row(
                          children: [
                            // seat image
                            Icon(
                              Icons.local_gas_station,
                              color: AppColors.zigoGreyTextColor,
                            ),
                            SizedBox(width: Dimensions.width4/2),
                            // seat text
                            Text(
                              'PMS',
                              style: GoogleFonts.poppins(
                                color: AppColors.zigoGreyTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font12+2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height4),
                    // The LITTLE DIVIDER
                    Container(
                      height: Dimensions.height10,
                      width: Dimensions.width50*2,
                      // color: Colors.red,
                      child: Divider(
                        thickness: Dimensions.height9/4,
                        color: AppColors.zigoGreyColor,
                        // endIndent: Dimensions.width50*5.5,
                      ),
                    ),
                    // Amount/Price HERE
                    Row(
                      children: [
                        Text(
                          '\$$price',
                          style: GoogleFonts.montserrat(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font26,
                          ),
                        ),
                        SizedBox(width: Dimensions.width4),
                        // A day
                        Text(
                          'A Day',
                          style: GoogleFonts.poppins(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                      ],
                    ),
                    // The RENT BUTTON
                    AppButton(
                      text: 'Rent', 
                      height: Dimensions.height30,
                      width: Dimensions.width50*3,
                      onTap: onTap,
                    ),
                  ],
                ), //end of the COL: Containing (seats, pump, amount, button)
                SizedBox(width: Dimensions.width4),
                // CAR/VEHICLE HERE
                Container(
                  height: Dimensions.height50*2,
                  width: Dimensions.height50*3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(vehicleImagePath),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}