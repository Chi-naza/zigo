import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/models/weather_model.dart';

class ComfortLevelCircularIndicator extends StatelessWidget {
  final Current currentWeatherData;
  
  const ComfortLevelCircularIndicator({Key? key, required this.currentWeatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: Text(
            'Comfort Level',
            style: GoogleFonts.poppins(
              fontSize: Dimensions.font20-2,
            ),
          ),
        ),
        // Sleek Circular Slider
        SizedBox(
          height: Dimensions.height30*6,
          child: SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: currentWeatherData.humidity.toDouble(),
            appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(
                bottomLabelText: 'Humidity',
                bottomLabelStyle: GoogleFonts.poppins(
                  letterSpacing: 0.1,
                  fontSize: Dimensions.font16,
                ),
              ),
              customWidths: CustomSliderWidths(
                handlerSize: 0,
                trackWidth: Dimensions.height12,
                progressBarWidth: Dimensions.height12,
              ),
              animationEnabled: true,
              size: Dimensions.height20*7,
              customColors: CustomSliderColors(
                hideShadow: true,
                trackColor: AppColors.firstGradientColor.withAlpha(100),
                progressBarColors: [
                  AppColors.firstGradientColor,
                  AppColors.secondGradientColor,
                ],
              ),
            ),
          ),
        ),
        // UVI and feelsLike in a Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 1st Row: Feels Like
            Row(
              children: [
                Text(
                  'Feels Like',
                  style: GoogleFonts.poppins(
                    fontSize: Dimensions.font16,
                    color: AppColors.textColorBlack,
                  ),
                ),
                SizedBox(width: Dimensions.width10),
                // value
                Text(
                  '34', //currentWeatherData.feelsLike.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: Dimensions.font16,
                    color: AppColors.textColorBlack
                  ),
                ),
              ],
            ),
            // 2nd Row: Uvi
            Row(
              children: [
                Text(
                  'UV Index',
                  style: GoogleFonts.poppins(
                    fontSize: Dimensions.font16,
                    color: AppColors.textColorBlack,
                  ),
                ),
                SizedBox(width: Dimensions.width10),
                // value
                Text(
                  '23',//currentWeatherData.uvIndex.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: Dimensions.font16,
                    color: AppColors.textColorBlack
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.height30), // space at the end
      ],
    );
  }
}