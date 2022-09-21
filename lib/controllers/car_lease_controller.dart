import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/car_lease_Model.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';

import '../constants/dimensions.dart';

class CarLeaseController extends GetxController{

  final carLeaseDataList = <CarLeaseModel>[].obs;


  // Instance of AuthController
  AuthController _authController = Get.find();


  @override
  void onReady() {
    // TODO: implement onReady
    getCarLeaseData();
    super.onReady();
  }



  Future<void> getCarLeaseData() async{
    try{
      // Getting down to the 'sub-collection' which is buried in the car_lease 'doc' of vehicle lease
      QuerySnapshot<Map<String, dynamic>> data = await vehicleLeaseRef.doc('car_lease').collection('cars').get();

      final itemsList = data.docs.map((e) => CarLeaseModel.fromSnapshot(e)).toList();

      carLeaseDataList.assignAll(itemsList);

      for(var car in carLeaseDataList){
        var imageUrl = await Get.find<FirebaseStorageService>().getImages(
          imageName: car.carName,
          storageFolder: 'car_lease_images',
          debugErrorText: 'STORAGE SERVICE ERROR(LEASE CARS)'
        );
        car.image = imageUrl!;
      }

      // updating our list after adding imageUrl
      carLeaseDataList.assignAll(itemsList);

      print(carLeaseDataList); //testing   


    }catch (e){
      print("GET CAR LEASE DATA ERROR: $e");
    }

  }





  // A function which when invoked by the user, rents a car. Saves the data in our DB
  Future<void> rentCar(String carName, CarLeaseModel carLeaseModel) async {

    try{     
      // Getting the details of the car to be rented 
      MyLeasedCarModel _myLeasedCarModel = MyLeasedCarModel(
        car: carLeaseModel.toJson(), 
        rentedAt: DateFormat.yMMMEd().format(DateTime.now()),
        totalAmount: '200', 
        daysOfRent: '5'
      );        

      // Takes MyLeasedCarModel instance and saves the given info to our FireStore DB (with userEmail as 'budgets' Doc Key)
      await userRef.doc('${_authController.getUser()!.email}').collection('leased_cars').doc(carName.toUpperCase()).set(_myLeasedCarModel.toJson());

      Get.snackbar(
        "", 
        "",
        titleText: Text("Car Rented Successfully", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text("You have just rented a new car called $carName", style: TextStyle(color: Colors.white,fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: AppColors.mainColorLight2,
      );

    }catch(e){
      Get.snackbar(
        "", 
        "",
        titleText: Text("Car Rent failed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text(e.toString(), style: TextStyle(color: Colors.white, fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }
  }









  

}