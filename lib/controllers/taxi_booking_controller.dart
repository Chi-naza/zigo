import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/taxi_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';

class TaxiBookingController extends GetxController {

  final taxiDetailsList = <TaxiModel>[].obs;

  @override
  void onReady() {
    getTaxiDetails();
    super.onReady();
  }


  Future<void> getTaxiDetails() async {
    try{
      QuerySnapshot<Map<String, dynamic>> data = await taxiRef.get();
      
      final taxiDetails = data.docs.map((e) => TaxiModel.fromSnapshot(e)).toList();
      taxiDetailsList.assignAll(taxiDetails);

      for(var taxi in taxiDetailsList){
        var picUrl = await Get.find<FirebaseStorageService>().getImages(
          imageName: taxi.carName,
          storageFolder: 'drriver_images', 
          debugErrorText: 'STORAGE SERVICE ERROR(DRIVERS)'
        );
        taxi.driverImage = picUrl!;
      }
      // after updating our email field
      taxiDetailsList.assignAll(taxiDetails);

      // TESTING
      taxiDetailsList.forEach((element) { 
        print(element.carName);
        print(element.driverFirstName.toUpperCase());
        print(element.driverLastName.toUpperCase());
      });
    }catch (e){
      print("GET TAXI DETAILS ERROR :: $e");
    }
  }







}


