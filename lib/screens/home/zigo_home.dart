import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Screen Width: ${Dimensions.screenWidth} and Height: ${Dimensions.screenHeight}"); // testing
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Welcome to Zigo Home',
              style: GoogleFonts.abel(fontSize: 49) ,
            ),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text("Local man"),
            style: ElevatedButton.styleFrom(
              primary: AppColors.mainColor,
              minimumSize: Size(200, 100),
              textStyle: GoogleFonts.langar(),
            ),
          ),
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.dark_mode), label: Text('I love you'))
        ],
      ),
    );
  }
}