import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/car_lease_card.dart';
import 'package:zigo/widgets/header.dart';

class BookVehicleListScreen extends StatelessWidget {
  const BookVehicleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
             // The main Header: i.e image & menu icon
            Header(),
            SizedBox(height: Dimensions.height20*3),
            // Header text and Search bar
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width18, right: Dimensions.width15),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BOOK TAXI',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.height20,
                            color: Colors.grey,
                            letterSpacing: 1,
                          ),
                        ),
                        // search container
                        Container(
                          height: Dimensions.height20*2,
                          width: Dimensions.width50*5,
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
                              // the search icon
                              Container(
                                height: Dimensions.height50,
                                width: Dimensions.width20*2,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                ), 
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),       
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
            // here's the Divider (wrapped around padding)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
              child: Divider(
                height: Dimensions.height12,
                thickness: Dimensions.height9/8,
                color: AppColors.zigoGreyColor,
              ),
            ),
            SizedBox(height: Dimensions.height30),
            // ROW of jetski, boat & cruise (in Padding)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // for Jetski
                  Container(
                    height: Dimensions.height50*1.5,
                    width: Dimensions.height50*1.5,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A71DE).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/jetski.png'),
                        SizedBox(height: Dimensions.height9),
                        Text(
                          'Jetski',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF071695),
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // for Boat
                  Container(
                    height: Dimensions.height50*1.5,
                    width: Dimensions.height50*1.5,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A71DE).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/boat.png'),
                        SizedBox(height: Dimensions.height9),
                        Text(
                          'Boat',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF071695),
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // for Cruise
                  Container(
                    height: Dimensions.height50*1.5,
                    width: Dimensions.height50*1.5,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A71DE).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/cruise.png'),
                        SizedBox(height: Dimensions.height9),
                        Text(
                          'Cruise',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF071695),
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30),
            // List of Vehicle Lease Card (with our Custom CarLeaseCard)
            CarLeaseCard(
              city: 'Ireland', 
              vehicleName: 'IFY CRUISE', 
              modelYear: '2022', 
              price: '500', 
              vehicleImagePath: 'assets/images/big_ship.png',
            ),
            SizedBox(height: Dimensions.height20),
            CarLeaseCard(
              city: 'Abuja',
              vehicleName: 'CHEVROLET GTS',
              modelYear: '2021',
              price: '500', 
              vehicleImagePath: 'assets/images/carlease_car.png',
            ),
            SizedBox(height: Dimensions.height20),
            CarLeaseCard(
              city: 'Abuja',
              vehicleName: 'CHEVROLET GTS',
              modelYear: '2021',
              price: '500', 
              vehicleImagePath: 'assets/images/carlease_car.png',
            ),
            SizedBox(height: Dimensions.height50),
          ],
        ),
      ),
    );
  }
}