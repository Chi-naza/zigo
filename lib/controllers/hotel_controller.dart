import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/hotel_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';

class HotelController extends GetxController {

  final hotelList = <HotelModel>[].obs;

  @override
  void onReady() {
    getAllHotels();
    super.onReady();
  }



   Future<void> getAllHotels() async{
    try{
      QuerySnapshot<Map<String, dynamic>> data = await hotelRef.get();

      final itemsList = data.docs.map((e) => HotelModel.fromSnapshot(e)).toList();

      hotelList.assignAll(itemsList);

      for(var hotel in hotelList){
        var imageUrl = await Get.find<FirebaseStorageService>().getImages(
          imageName: hotel.hotelName,
          storageFolder: 'hotel_images',
          debugErrorText: 'STORAGE SERVICE ERROR(HOTEL)'
        );
        hotel.image = imageUrl!; 
      }

      // updating our list after adding imageUrl
      hotelList.assignAll(itemsList);

      //testing
      for (var a in hotelList){
        print("Hotel IMAGE ::::: ${a.image}");
      }


    }catch (e){
      print("GET HOTEL ITEMS ERROR: $e");
    }
    
  }


  void bookHotel(String hotelName){
    try{

      Get.snackbar(
        "", 
        "",
        titleText: Text("Hotel Booking Successful", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text("You have just booked $hotelName", style: TextStyle(color: Colors.white,fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: AppColors.mainColorLight2,
      );

    }catch(e){
      Get.snackbar(
        "", 
        "",
        titleText: Text("Hotel Booking Failed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text(e.toString(), style: TextStyle(color: Colors.white, fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }
  }


}