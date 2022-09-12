import 'package:flutter/material.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.height20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // hamburger/menu icon. Wrapped with builder to enable custom Drawer
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: (() {
                      Scaffold.of(context).openDrawer();
                    }),
                    child: Icon(
                      Icons.menu,
                      size: Dimensions.height50*1.2,
                      color: AppColors.zigoGreyColor,
                    ),
                  );
                }
              ),
              //profile image
              CircleAvatar(
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),// will fall back to this if foreground is wrong/null
                // foregroundImage: AssetImage('assets/images/splash23.png'),
                radius: Dimensions.radius30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}