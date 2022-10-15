import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/flight_model.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/services/firebase_storage_services.dart';
import 'package:zigo/widgets/custom_snackbar.dart';

class FlightController extends GetxController {

  final flightDataList = <FlightModel>[].obs;

  // List holding selected seats (their indexes)
  final selectedFlightSeatsIndexList = <int>[].obs;

  // User Requested Planes
  final userRequestedFlights = <FlightModel>[].obs;

  //TODO: will take the place of oneFlightModel
  late FlightModel choiceFlight;

  // AN instance of AuthController
  AuthController _authController = Get.find();

  //Seat status variables
  final availableSeats = 0.obs;
  final unAvailableSeats = 0.obs;
  final chosenSeats = 0.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getFlightData();
    super.onReady();
  }


  Future<void> getFlightData() async {
    try{
      QuerySnapshot<Map<String, dynamic>> data = await flightDataRef.get();

      final itemList = data.docs.map((e) => FlightModel.fromSnapshot(e)).toList();
      
      flightDataList.assignAll(itemList);

      // Getting flight images from fireBase Storage and passing the url to our FlightModel List
      for(var plane in flightDataList){
        var imageUrl = await Get.find<FirebaseStorageService>().getFlightImages(
          imageName: "${plane.flightName.toUpperCase()} ${plane.flightID.toUpperCase()}",
          storageFolder: 'flight_images', 
          debugErrorText: 'FAILED TO GET FLIGHT IMAGES',
        );
        plane.image = imageUrl!;
        print("Gotten Flight ImageUrl: ${plane.image}"); // test
      }

      // updating our list after adding imageUrl
      flightDataList.assignAll(itemList);

    }catch (e){
      print("FLIGHT GET DATA ERROR :: $e");
    }
  }




  // A function which implements the booking of a flight
  Future<void> bookFlight({required FlightModel plane, required BookedFlightModel bookedFlightModel}) async {
    try{ 

      if(selectedFlightSeatsIndexList.isNotEmpty){
        // registers our booking details in our DB; using plane Name&ID as the key for Doc 
        await userRef.doc(_authController.getUser()!.email).collection('booked_flights').doc("${plane.flightName.toUpperCase()} ${plane.flightID.toUpperCase()}").set(bookedFlightModel.toJson());
        
        //Modifying & Updating the status of seats in a plane which is booked
        await updateFlightSeats(plane);
        
        // Our custom Snackbar
        customSnackbar(
          titleText: "Flight Booking Successful", 
          bodyText: "You have just booked ${plane.flightName.toUpperCase()} ${plane.flightID.toUpperCase()}"
        );

        // we navigate to home when booking succeeds
        _authController.navigateToHomeScreen();

      }else{
        customSnackbar(
          titleText: "No Seats Selected", 
          bodyText: "Please go back and choose a seat in order to complete your booking",
          isError: true
        );
      }      

    }catch(e){
      customSnackbar(
        titleText: "Flight Booking Failed", 
        bodyText: e.toString(),
        isError: true
      );
    }
  
  }



  // A function which gets a specific plane based on users input of dateOfDeparture, airportName and cityOfDeparture
  void getMyDesiredPlane({required String dateOfDeparture, required String airport, required cityOfDeparture}){
    List<FlightModel> data = [];
  
    for(var plane in flightDataList){
      if(plane.cityOfDeparture==cityOfDeparture){
        data.add(plane);
      }
    }

    // Adding the filtered planes to a new list
    userRequestedFlights.assignAll(data);
    update();

    print("User Requested Flights: $userRequestedFlights");// For testing
  }




  // Function that will return the flight that user chooses in the list of UserRequested Flights
  FlightModel getChoiceFlight(FlightModel choiceFlight){
    print("Choice Flight Gotten $choiceFlight");
    this.choiceFlight = choiceFlight;
    return choiceFlight;
  }



  // A function which updates the seats available for a particular plane, when the user has succeeded in booking a flight
  Future<void> updateFlightSeats(FlightModel plane) async {
    try{
      // If selectedList is not empty, check all the indexes selected, if it matches any index in 
      // the List of seats in the plane, then, set the seat as picked
      if(selectedFlightSeatsIndexList.isNotEmpty){

        for(var seat in plane.seats){
          for(var index in selectedFlightSeatsIndexList){
            if(plane.seats.indexOf(seat) == index){
              seat['picked'] = true;
            }
          }
        }

        await flightDataRef.doc("${plane.flightName.toUpperCase()} ${plane.flightID.toUpperCase()}").update(plane.toJson()); //set(plane.toJson());
        selectedFlightSeatsIndexList.clear();
        update();

        print("Updated Plane Seats Successfully");

      }    
     
    }catch (e){
      print("Plane Seat Update Error: $e");
    }
  }



  // A function which calculates and shows the status of seats  and their related numbers
  void showSeatStatus(FlightModel plane){
    chosenSeats.value = selectedFlightSeatsIndexList.length;
    List nullSeats = [];
    List availSeats = [];

    for(var a in plane.seats){
      if(a['picked'] == true){
        nullSeats.add(a);
      }else{
        availSeats.add(a);
      }
    }

    availableSeats.value = availSeats.length;
    unAvailableSeats.value = nullSeats.length;
  }


  





}