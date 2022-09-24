import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/boat_lease_model.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';
import 'package:zigo/widgets/custom_snackbar.dart';

class BoatLeaseController extends GetxController{

  final boatLeaseDataList = <BoatLeaseModel>[].obs;

  // AuthController instance
  AuthController _authController = Get.find();

  @override
  void onReady() {
    // TODO: implement onReady
    getBoatLeaseData();
    super.onReady();
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



   // A function which when invoked by the user, rents a boat. Saves the data in our DB
  Future<void> rentBoat(String boatName, BoatLeaseModel boatLeaseModel) async {

    try{     
      // Getting the details of the boat to be rented 
      MyLeasedBoatModel _myLeasedBoatModel = MyLeasedBoatModel(
        boat: boatLeaseModel.toJson(), 
        rentedAt: DateFormat.yMMMEd().format(DateTime.now()), 
        totalAmount: '200', 
        daysOfRent: '5'
      );
      
      // Takes MyLeasedBoatModel instance and saves the given info in our FireStore DB (with userEmail as 'budgets' Doc Key)
      await userRef.doc('${_authController.getUser()!.email}').collection('leased_boats').doc(boatName.toUpperCase()).set(_myLeasedBoatModel.toJson());

      customSnackbar(
        titleText: "Boat Rented Successfully", 
        bodyText: "You have just rented a new boat called $boatName"
      );

    }catch(e){
      customSnackbar(
        titleText: "Boat Rent failed", 
        bodyText: e.toString(),
        isError: true
      );
    }
  }





}