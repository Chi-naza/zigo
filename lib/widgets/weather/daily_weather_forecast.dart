import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/models/weather_model.dart';

class DailyWeatherForecast extends StatelessWidget {
  final List<Daily> dailyWeatherData;
  
  const DailyWeatherForecast({Key? key, required this.dailyWeatherData}) : super(key: key);

    // A function formatting the dateTime and returning the day value in a string format
    String getDay(dateTime){
      DateTime date = DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
      String x = DateFormat('EEE').format(date);
      return x;
    }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: Dimensions.height50*8,
      width: Dimensions.width45*2,
      margin: EdgeInsets.all(Dimensions.height20),
      padding: EdgeInsets.all(Dimensions.height15),
      decoration: BoxDecoration(
        color: AppColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: Dimensions.height10),
            child: Text(
            'Next Days', 
            style: GoogleFonts.poppins(
              color: AppColors.textColorBlack,
              fontSize: Dimensions.font20,
            )
          ),
          ),
          // Daily Data LIST
          Container(
            height: Dimensions.height50*6,
            child: ListView.builder(
              itemCount: dailyWeatherData.length > 7? 7 : dailyWeatherData.length,
              itemBuilder: ((context, index) {
                var wDaily = dailyWeatherData[index];
                return Column(
                  children: [
                    Container(
                      height: Dimensions.height30*2,
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Days of the week
                          SizedBox(
                            width: Dimensions.width20*4,
                            child: Text(
                              getDay(wDaily.dt),
                              style: GoogleFonts.poppins(
                                color: AppColors.textColorBlack
                              )
                            ),
                          ),
                          // Weather Icons
                          SizedBox(
                            width: Dimensions.width30,
                            height: Dimensions.height30,
                            child: Image.asset('assets/images/weather/${wDaily.weather[0].icon}.png'),
                          ),
                          // Min / Max
                          Text(
                            '${wDaily.temp.max.round()}/${wDaily.temp.min.round()} °C',
                            style: GoogleFonts.poppins(
                              color: AppColors.textColorBlack
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}