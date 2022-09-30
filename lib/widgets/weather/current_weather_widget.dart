import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/models/weather_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Current currentWeather;
  
  const CurrentWeatherWidget({Key? key, required this.currentWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //icon
              Image.asset(
                'assets/images/weather/${currentWeather.weather[0].icon}.png', // curr-weather icon
                height: Dimensions.height45*1.8,
                width: Dimensions.width45*1.8,
              ),
              // custom divider
              Container(
                height: Dimensions.height50,
                width: 1,
                color: AppColors.dividerLine,
              ),
              // Temp
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${currentWeather.temp.round()}°', // Temp
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.height30*2,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    TextSpan(
                      text: 'C ', // Temp
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.height30*1.5,
                        color: AppColors.textColorBlack.withOpacity(0.5),
                      ),
                    ),
                    TextSpan(
                      text: currentWeather.weather[0].description, // Weather description
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.height16,
                        color: AppColors.zigoGreyTextColor,
                      ),
                    ),
                  ],
                ), 
                
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height25),
        // Column with more weather details: humidity, clouds, windspeed
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: Dimensions.height30*2,
                  width: Dimensions.width30*2,
                  padding: EdgeInsets.all(Dimensions.height16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20/1.8),
                  ),
                  child: Image.asset('assets/icons/windspeed.png'),
                ),
                Container(
                  height: Dimensions.height30*2,
                  width: Dimensions.width30*2,
                  padding: EdgeInsets.all(Dimensions.height16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20/1.8),
                  ),
                  child: Image.asset('assets/icons/clouds.png'),
                ),
                Container(
                  height: Dimensions.height30*2,
                  width: Dimensions.width30*2,
                  padding: EdgeInsets.all(Dimensions.height16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20/1.8),
                  ),
                  child: Image.asset('assets/icons/humidity.png'),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height10/2),
            // Text Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // windspeed
                SizedBox(
                  height: Dimensions.height20,
                  width: Dimensions.width30*2.4,
                  child: Text(
                    '${currentWeather.windSpeed}km/hr',
                    style: GoogleFonts.poppins(fontSize: Dimensions.font12),
                    textAlign: TextAlign.center,
                  ),
                ),
                // clouds
                SizedBox(
                  height: Dimensions.height20,
                  width: Dimensions.width30*2.4,
                  child: Text(
                    '${currentWeather.clouds}%',
                    style: GoogleFonts.poppins(fontSize: Dimensions.font12),
                    textAlign: TextAlign.center,
                  ),
                ),
                // humidity
                SizedBox(
                  height: Dimensions.height20,
                  width: Dimensions.width30*2.4,
                  child: Text(
                    '${currentWeather.humidity}%',
                    style: GoogleFonts.poppins(fontSize: Dimensions.font12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}