
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String firstName;
  String lastName;
  String? phoneNumber;
  String? profileImage;
  String? address;
  List<MyBudgetModel>? budget;
  List<BookedHotelModel>? bookedHotel;
  List<BookedFlightModel>? bookedFlight;
  List<BookedTaxiModel>? bookedTaxi;


  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.profileImage,
    this.address,
    this.budget,
    this.bookedHotel,
    this.bookedFlight,
    this.bookedTaxi
  });


  UserModel.fromJson(Map<String, dynamic> json):
    email = json['email'],
    firstName = json['first_name'],
    lastName = json['last_name'],
    phoneNumber = json['phone_number'],
    profileImage = json['profile_image'],
    address = json['address'],
    budget = (json['budget'] as List).map((e) => MyBudgetModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedHotel = (json['booked_hotel'] as List).map((e) => BookedHotelModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedFlight = (json['booked_flight'] as List).map((e) => BookedFlightModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedTaxi = (json['booked_taxi'] as List).map((e) => BookedTaxiModel.fromJson(e as Map<String, dynamic>)).toList();


  // for firebase  
  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    email = snapshot['email'],
    firstName = snapshot['first_name'],
    lastName = snapshot['last_name'],
    phoneNumber = snapshot['phone_number'],
    profileImage = snapshot['profile_image'],
    address = snapshot['address'],
    budget = (snapshot['budget'] as List).map((e) => MyBudgetModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedHotel = (snapshot['booked_hotel'] as List).map((e) => BookedHotelModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedFlight = (snapshot['booked_flight'] as List).map((e) => BookedFlightModel.fromJson(e as Map<String, dynamic>)).toList(),
    bookedTaxi = (snapshot['booked_taxi'] as List).map((e) => BookedTaxiModel.fromJson(e as Map<String, dynamic>)).toList();
  


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['profile_image'] = this.profileImage;
    data['address'] = this.address;
 
    return data;
  }
}




class MyBudgetModel {
  String  itemName;
  double itemPrice;
  String createdAt;
  String totalAmount;
  String budgetName;

  MyBudgetModel({
    required this.itemName,
    required this.itemPrice,
    required this.createdAt,
    required this.totalAmount,
    required this.budgetName
  });


  MyBudgetModel.fromJson(Map<String, dynamic> json):
    itemName = json['item_name'],
    itemPrice = json['item_price'],
    createdAt = json['created_at'],
    totalAmount = json['total_amount'],
    budgetName = json['budget_name'];

  // for getting data from firebase
  MyBudgetModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    itemName = snapshot['item_name'],
    itemPrice = snapshot['item_price'],
    createdAt = snapshot['created_at'],
    totalAmount = snapshot['total_amount'],
    budgetName = snapshot['budget_name'];


  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['created_at'] = this.createdAt;
    data['total_amount'] = this.totalAmount;
    data['budget_name'] = this.budgetName;
 
    return data;
  }


}






class BookedHotelModel{
  String hotelName;
  String typeOfRoom;
  int noOfRooms;
  String startDate;
  String endDate;


  BookedHotelModel({
    required this.hotelName,
    required this.typeOfRoom,
    required this.noOfRooms,
    required this.startDate,
    required this.endDate
  });


  BookedHotelModel.fromJson(Map<String, dynamic> json):
    hotelName = json['name'],
    typeOfRoom = json['type_of_room'],
    noOfRooms = json['no_of_rooms'],
    startDate = json['start_date'],
    endDate = json['end_date'];

  // for getting data from firebase
  BookedHotelModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    hotelName = snapshot['name'],
    typeOfRoom = snapshot['type_of_room'],
    noOfRooms = snapshot['no_of_rooms'],
    startDate = snapshot['start_date'],
    endDate = snapshot['end_date'];


  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.hotelName;
    data['type_of_room'] = this.typeOfRoom;
    data['no_of_rooms'] = this.noOfRooms;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
 
    return data;
  }


}





class BookedFlightModel {
  String flightName;
  String cityOfArrival;
  String cityOfDeparture;
  String startAirport;
  String endAirport;
  String dateOfDeparture;
  String dateOfReturn;
  String seatClass;
  int noOfPersons;
  String luggage;
  double amountDue;


  BookedFlightModel({
    required this.flightName,
    required this.cityOfArrival,
    required this.cityOfDeparture,
    required this.startAirport,
    required this.endAirport,
    required this.dateOfDeparture,
    required this.dateOfReturn,
    required this.seatClass,
    required this.noOfPersons,
    required this.luggage,
    required this.amountDue
  });


  BookedFlightModel.fromJson(Map<String, dynamic> json):
    flightName = json['flight_name'],
    cityOfArrival = json['city_of_arrival'],
    cityOfDeparture = json['city_of_departure'],
    startAirport = json['start_airport'],
    endAirport = json['end_airport'],
    dateOfDeparture = json['date_of_departure'],
    dateOfReturn = json['date_of_return'],
    seatClass = json['seat_class'],
    noOfPersons = json['no_of_persons'],
    luggage = json['luggage'],
    amountDue = json['amount_due'];
    

  // for getting data from firebase
  BookedFlightModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    flightName = snapshot['flight_name'],
    cityOfArrival = snapshot['city_of_arrival'],
    cityOfDeparture = snapshot['city_of_departure'],
    startAirport = snapshot['start_airport'],
    endAirport = snapshot['end_airport'],
    dateOfDeparture = snapshot['date_of_departure'],
    dateOfReturn = snapshot['date_of_return'],
    seatClass = snapshot['seat_class'],
    noOfPersons = snapshot['no_of_persons'],
    luggage = snapshot['luggage'],
    amountDue = snapshot['amount_due'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_name'] = this.flightName;
    data['city_of_arrival'] = this.cityOfArrival;
    data['city_of_departure'] = this.cityOfDeparture;
    data['start_airport'] = this.startAirport;
    data['end_airport'] = this.endAirport;
    data['date_of_departure'] = this.dateOfDeparture;
    data['date_of_return'] = this.dateOfReturn;
    data['seat_class'] = this.seatClass;
    data['no_of_persons'] = this.noOfPersons;
    data['luggage'] = this.luggage;
    data['amount_due'] = this.amountDue;
 
    return data;
  }


}




class BookedTaxiModel{
  String currentLocation;
  String destination;
  int noOfPersons;
  String luggage;


  BookedTaxiModel({
    required this.currentLocation,
    required this.destination,
    required this.noOfPersons,
    required this.luggage
  });



  BookedTaxiModel.fromJson(Map<String, dynamic> json):
    currentLocation = json['current_location'],
    destination = json['destination'],
    noOfPersons = json['no_of_persons'],
    luggage = json['luggage'];
   

  // for getting data from firebase
  BookedTaxiModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    currentLocation = snapshot['current_location'],
    destination = snapshot['destination'],
    noOfPersons = snapshot['no_of_persons'],
    luggage = snapshot['luggage'];




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
      data['current_location'] = this.currentLocation;
      data['destination'] = this.destination;
      data['no_of_persons'] = this.noOfPersons;
      data['luggage'] = this.luggage;
 
    return data;
  }



}


