import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/car_lease_card.dart';
import 'package:zigo/widgets/header/header.dart';

class CarLeaseListScreen extends StatelessWidget {
  const CarLeaseListScreen({Key? key}) : super(key: key);

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
                          'CAR LEASE',
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
            // Car Lease Card Section
            const CarLeaseCard(
              city: 'Abuja',
              vehicleName: 'CHEVROLET GTS',
              modelYear: '2021',
              price: '500',
              vehicleImagePath: 'assets/images/carlease_car.png',
            ),
            SizedBox(height: Dimensions.height20),
            const CarLeaseCard(
              city: 'Abuja',
              vehicleName: 'CHEVROLET GTS',
              modelYear: '2021',
              price: '500',
              vehicleImagePath: 'assets/images/carlease_car.png',
            ),
            SizedBox(height: Dimensions.height20),
            const CarLeaseCard(
              city: 'Abuja',
              vehicleName: 'CHEVROLET GTS',
              modelYear: '2021',
              price: '500',
              vehicleImagePath: 'assets/images/carlease_car.png',
            ),
            SizedBox(height: Dimensions.height50*2),
          ],
        ),
      ),
    );
  }
}

