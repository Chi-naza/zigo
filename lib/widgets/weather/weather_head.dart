import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/weather_controller.dart';

class WeatherHead extends StatefulWidget {
  WeatherHead({Key? key}) : super(key: key);

  @override
  State<WeatherHead> createState() => _WeatherHeadState();
}

class _WeatherHeadState extends State<WeatherHead> {
  WeatherController weatherController = Get.find();
  String city = "";
  String date = DateFormat.yMMMd().format(DateTime.now());
  
  @override
  void initState() {
    // calling get Address function
    getAddress(
      lat: weatherController.getLatitude().value,
      long: weatherController.getLongitude().value,
    );

    super.initState();
  }

  // The get Address function
  getAddress({lat, long}) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    
    setState(() {
      city = place.locality!;
    });
    print("CITY ----- $city");
    print("PLACEMARK----- $placemark");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // City
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: GoogleFonts.poppins(
              fontSize: Dimensions.font12*2.7,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        // Date
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: Dimensions.font16,
              color: AppColors.zigoGreyTextColor,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20)
      ],
    );
  }
}