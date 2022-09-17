import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/boat_lease_model.dart';
import 'package:zigo/models/car_lease_Model.dart';
import 'package:zigo/services/firebase_storage_services.dart';

class VehicleLeaseController extends GetxController{

  final carLeaseDataList = <CarLeaseModel>[].obs;
  final boatLeaseDataList = <BoatLeaseModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getCarLeaseData();
    getBoatLeaseData();
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




  Future<void> getBoatLeaseData() async{
    try{
      // Getting down to the 'sub-collection' which is buried in the car_lease 'doc' of vehicle lease
      QuerySnapshot<Map<String, dynamic>> data = await vehicleLeaseRef.doc('boat_lease').collection('boats').get();

      final boatLeaseData = data.docs.map((e) => BoatLeaseModel.fromSnapshot(e)).toList();

      boatLeaseDataList.assignAll(boatLeaseData);

      for(var boat in boatLeaseDataList){
        var imageUrl = await Get.find<FirebaseStorageService>().getImages(
          imageName: boat.name,
          storageFolder: 'boat_lease_images',
          debugErrorText: 'STORAGE SERVICE ERROR(LEASE BOATS)'
        );
        boat.image = imageUrl!;
      }

      // updating our list after adding imageUrl
      boatLeaseDataList.assignAll(boatLeaseData);

      print(boatLeaseDataList); //testing   


    }catch (e){
      print("GET BOAT LEASE DATA ERROR: $e");
    }

  }





}