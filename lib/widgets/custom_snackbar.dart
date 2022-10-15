 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

customSnackbar({required String titleText, required String bodyText, bool isError = false}){
  return Get.snackbar(
    "", 
    "",
    titleText: Text(titleText, style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold, fontSize: Dimensions.font16)),
    messageText: Text(bodyText, style: GoogleFonts.poppins(color: Colors.white,fontSize: Dimensions.font12)),
    colorText: Colors.white,
    backgroundColor: isError? Colors.redAccent : AppColors.mainColorLight2,
  );
 }