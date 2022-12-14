import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/hotel_model.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';
import 'package:zigo/widgets/custom_snackbar.dart';

class HotelController extends GetxController {

  final hotelList = <HotelModel>[].obs;

  // AuthController instance
  AuthController _authController = Get.find();

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



  // A function which implements the booking of a hotel
  Future<void> bookHotel(String hotelName, HotelModel hotel, String typeOfRoom, String noOfRooms, String startDate, String endDate) async {
    try{

      BookedHotelModel bookedHotelModel = BookedHotelModel(
        hotel: hotel.toJson(), 
        typeOfRoom: typeOfRoom, 
        noOfRooms: noOfRooms, 
        startDate: startDate, 
        endDate: endDate
      );

      print("Booked Hotel Model: ${bookedHotelModel}"); // testing
      print("Hotel Model: ${hotel}"); // testing

      await userRef.doc(_authController.getUser()!.email).collection('booked_hotels').doc(hotelName.toUpperCase()).set(bookedHotelModel.toJson());

      customSnackbar(
        titleText:"Hotel Booking Successful", 
        bodyText: "You have just booked $hotelName"
      );

      // On successful hotel booking, we navigate to home
      _authController.navigateToHomeScreen();

    }catch(e){
      customSnackbar(
        titleText:"Hotel Booking Failed", 
        bodyText: e.toString(),
        isError: true
      );
    }
  }


}