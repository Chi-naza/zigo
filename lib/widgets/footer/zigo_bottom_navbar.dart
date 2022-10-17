import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/screens/home/zigo_home.dart';

class ZigoBottomNavBar extends StatelessWidget {
  final bool isHomeClicked;
  final bool isSearchClicked;
  final bool isSettingsClicked;
  
  const ZigoBottomNavBar({Key? key, this.isHomeClicked=false, this.isSearchClicked=false, this.isSettingsClicked=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: Dimensions.height25*3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Spacer(flex: 25),
            // Global search
            InkWell(
              child: Container(
                height: Dimensions.height25*3,
                width: Dimensions.width50*1.5,
                padding: EdgeInsets.all(Dimensions.height20+2),
                color: isSearchClicked? Colors.grey.shade300:Colors.white,
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
            // Home
            InkWell(
              onTap: () {
                Get.offAllNamed(HomeScreen.routeName);
              },
              child: Container(
                height: Dimensions.height25*3,
                width: Dimensions.width50*1.8,
                padding: EdgeInsets.all(Dimensions.height10),
                color: isHomeClicked? Colors.grey.shade300:Colors.white,
                child: SvgPicture.asset('assets/icons/home-icon.svg'),
              ),
            ),
            
            // Settings
            InkWell(
              child: Container(
                height: Dimensions.height25*3,
                width: Dimensions.width50*1.3,
                padding: EdgeInsets.all(Dimensions.height20+2),
                color: isSettingsClicked? Colors.grey.shade300:Colors.white,
                child: SvgPicture.asset('assets/icons/settings.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}