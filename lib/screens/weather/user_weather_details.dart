import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/weather_controller.dart';
import 'package:zigo/widgets/weather/comfort_level_indicator.dart';
import 'package:zigo/widgets/weather/current_weather_widget.dart';
import 'package:zigo/widgets/weather/daily_weather_forecast.dart';
import 'package:zigo/widgets/weather/hourly_data_widget.dart';
import 'package:zigo/widgets/weather/weather_head.dart';


class UserWeatherDetailsScreen extends StatefulWidget {
  const UserWeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserWeatherDetailsScreen> createState() => _UserWeatherDetailsScreenState();
}

class _UserWeatherDetailsScreenState extends State<UserWeatherDetailsScreen> {
  /// Injecting our dependency
  final WeatherController weatherController = Get.put(WeatherController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          return weatherController.checkLoading().isTrue? Center( child: CircularProgressIndicator()) : ListView(
            children: [
              SizedBox(height: Dimensions.height20),
              // The Head
              WeatherHead(),
              // Current Weather Data
              CurrentWeatherWidget(currentWeather: weatherController.currentWeatherData),
              // Hourly Weather Data
              HourlyDataWidget(hourlyWeatherData: weatherController.hourlyWeatherList),
              // Daily Weather ForeCast
              DailyWeatherForecast(dailyWeatherData: weatherController.dailyWeatherList),
              // Divider
              Container(
                height: 1,
                color: AppColors.dividerLine,
              ),
              SizedBox(height: Dimensions.height20),
              // The circular comfort indicator
              ComfortLevelCircularIndicator(currentWeatherData: weatherController.currentWeatherData),
            ],
          );
        }),
      ),
    );
  }
}