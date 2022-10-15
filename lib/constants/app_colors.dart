import 'package:flutter/material.dart';

class AppColors {

  static final Color mainColor = Color(0xFF0A71DE);
  static final Color mainColorDark = Color(0xFF0400B1);
  static final Color mainColorLight1 = Color(0xFF4E9DF0);
  static final Color mainColorLight2 = Color(0xFF95C3F2);
  static final Color mainColorLight3 = Color.fromARGB(255, 166, 205, 245);
  static final Color zigoTextBlackColor = Color(0xFF6C6C6C);
  static final Color zigoGreyColor = Color(0xFFCACACA);
  static final Color zigoGreyTextColor = Color(0xFF9b9b9b);
  static final Color zigoBackgroundColor = Color(0xFFE5E5E5);
  static final Color zigoBackgroundColor2 = Color(0xFFEFEFEF);
  static final Color starColor = Color(0xFFFEDE38);
  
  static final Color mainWhiteColor = Color(0xFFFFFFFF);

  // For Weather
  static const dividerLine = Color(0xffE4E4EE);
  static const cardColor = Color(0xffE9ECF1);
  static const textColorBlack = Color(0xff171717);
  static const firstGradientColor = Color(0xff408ADE);
  static const secondGradientColor = Color(0xff5286CD);

  // Taxi & Map
  static const Color cityblue = const Color(0xFF2669A4);
  static const Color cityWhite = const Color(0xFFFFFFFF);
  static const Color cityBlack = const Color(0xFF3E3D3D);
  static const Color cityLightGrey = const Color(0xFFE6E7E8);
  static const Color cityGrey = Color(0xFF707070);
  static const Color cityOrange = Color(0xFFE39219);

}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
