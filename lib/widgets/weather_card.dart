import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class WeatherCard extends StatelessWidget {
  final String temp;
  final String city;
  final List<Color>? color;
  final Widget? iconWidget;
  final bool showTemp;
  
  const WeatherCard({Key? key, required this.temp, required this.city, this.color, this.iconWidget, this.showTemp = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50*2.3,
      width: Dimensions.height50*2.3,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1,1),
            color: Colors.grey.withOpacity(0.6),
            blurRadius: Dimensions.height10,
          ),
        ],
        borderRadius: BorderRadius.circular(Dimensions.font20/4),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: color?? [
            Colors.white,
            AppColors.mainColorLight3,
          ]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Weather image
          iconWidget??FaIcon(
            FontAwesomeIcons.cloudRain,
            size: Dimensions.height30+5,
            color: Colors.lightBlue.withOpacity(0.6),
          ),
          SizedBox(height: Dimensions.height4),
          // Temp. in Degrees
          if(showTemp)
            Text(
              temp, //'26 °C',
              style: GoogleFonts.montserrat(
                color: AppColors.zigoTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: Dimensions.font26,                         
              ),
            ),
          // Location/City
          Text(
            city, //'Enugu',
            style: GoogleFonts.poppins(
              color: AppColors.zigoTextBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimensions.font16,                         
            ),
          ),
        ],
      ),
    );
  }
}