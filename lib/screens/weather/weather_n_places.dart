import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header/header_section.dart';
import 'package:zigo/widgets/weather_card.dart';

class WeatherAndPlacesScreen extends StatelessWidget {
  const WeatherAndPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // header HERE
          HeaderSection(headerText: 'WEATHER FORECAST'),
          // "Enter City" Search Input Field
          Container(
            height: Dimensions.height20*2,
            width: Dimensions.screenWidth - 50,
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
                      hintText: 'Enter city name',
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
          SizedBox(height: Dimensions.height50),
          // Places or Cities and their WEATHERS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherCard(
                temp: '26 °C',
                city: 'Enugu', 
                iconWidget: Text('')
              ),
              SizedBox(width: Dimensions.width50),
              WeatherCard(
                temp: '26 °C',
                city: 'Abuja', 
                color: [
                  Colors.white,
                  Colors.pink.shade100,
                ],
              ),
            ],
          ),
          SizedBox(height: Dimensions.height30),
          // 2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeatherCard(
                temp: '26 °C',
                city: 'Lagos', 
                color: [
                  Colors.white,
                  Colors.green.shade100,
                ],
              ),
              SizedBox(width: Dimensions.width50),
              WeatherCard(
                iconWidget: Icon(
                  Icons.edit_outlined,
                  size: Dimensions.height50,
                  color: Colors.lightBlue.withOpacity(0.6),
                ),
                temp: '',
                showTemp: false,
                city: 'Add Location', 
              ),
            ],
          ),
        ],
      ),
    );
  }
}