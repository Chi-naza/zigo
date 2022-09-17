import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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


}