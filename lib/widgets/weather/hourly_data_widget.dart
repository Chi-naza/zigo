import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/weather_controller.dart';
import 'package:zigo/models/weather_model.dart';



class HourlyDataWidget extends StatelessWidget {
  final List<Hourly> hourlyWeatherData;
  
  HourlyDataWidget({Key? key, required this.hourlyWeatherData}) : super(key: key);

  // Linking cardIndex var here with the method and index Variable in the WeatherController
  RxInt cardIndex = WeatherController().getCurrentIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Today text
        Container(
          margin: EdgeInsets.only(top: Dimensions.height10),
          alignment: Alignment.topCenter,
          child: Text(
            'Today',
            style: GoogleFonts.poppins(fontSize: Dimensions.font23, fontWeight: FontWeight.w600),
          ),
        ),
        // Hourly List View
        Container(
          height: Dimensions.height50*4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeatherData.length > 24? 24 : hourlyWeatherData.length,
            itemBuilder: (context, index) {
              var hourly = hourlyWeatherData[index];
              return Obx(() {
                  return GestureDetector(
                    onTap: (() {
                      cardIndex.value = index;
                    }),
                    child: Container(
                      width: Dimensions.width45*2,
                      margin: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                        // if cardIndex equals the curr index, apply gradient
                        gradient: cardIndex.value == index? const LinearGradient(
                          colors: [
                            AppColors.firstGradientColor,
                            AppColors.secondGradientColor,
                          ],
                        ) : null,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0.5, 0),
                            blurRadius: Dimensions.height30,
                            spreadRadius: 1,
                            color: AppColors.dividerLine.withAlpha(150),
                          ),
                        ]
                      ),
                      // Our Custom Card for Hourly Lists
                      child: HourlyCard(
                        temp: hourly.temp.round(),
                        timeStamp: hourly.dt,
                        weatherIcon: hourly.weather[0].icon,
                        isIndex: cardIndex.value == index,
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ),
      ],
    );
  }
}




class HourlyCard extends StatelessWidget {
  final int temp;
  final int timeStamp;
  final String weatherIcon;
  final bool isIndex;
  
  const HourlyCard({Key? key, required this.temp, required this.timeStamp, required this.weatherIcon, required this.isIndex}) : super(key: key);

  // A function formatting the dateTime and returning the time value in a string format
  String getTime(final timeStamp){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // timeStamps
        Container(
          margin: EdgeInsets.only(top: Dimensions.height10),
          child: Text(
            getTime(timeStamp), 
            style: GoogleFonts.poppins(
              color: isIndex? AppColors.mainWhiteColor : null,
            )
          ),
        ),
        // Icons
        Container(
          margin: EdgeInsets.all(Dimensions.height10),
          child: Image.asset(
            'assets/images/weather/$weatherIcon.png',
            height: Dimensions.height30*2,
            width: Dimensions.width30*2,
          ),
        ),
        // Temp
        Container(
          margin: EdgeInsets.only(bottom: Dimensions.height10),
          child: Text(
            '$temp °C', 
            style: GoogleFonts.poppins(
              color: isIndex? AppColors.mainWhiteColor : null,
            )
          ),
        ),
      ],
    );
  }
}