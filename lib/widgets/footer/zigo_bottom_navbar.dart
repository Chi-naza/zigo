import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/screens/reservations.dart';

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
            const Spacer(flex: 13),
            // Home
            InkWell(
              onTap: () {
                Get.offAllNamed(Reservations.routeName);
              },
              child: Container(
                height: Dimensions.height25*3,
                width: Dimensions.width50*1.8,
                padding: EdgeInsets.all(Dimensions.height10),
                color: isHomeClicked? Colors.grey.shade300:Colors.white,
                child: SvgPicture.asset('assets/icons/home-icon.svg'),
              ),
            ),
            const Spacer(),
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
            const Spacer(),
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