import 'package:cloud_firestore/cloud_firestore.dart';

class FlightModel {
  String flightName;
  String cityOfArrival;
  String cityOfDeparture;
  String startAirport;
  String endAirport;
  String dateOfDeparture;
  String duration;
  int noOfSeats;
  double price;
  List? seats;


  FlightModel({
    required this.flightName,
    required this.cityOfArrival,
    required this.cityOfDeparture,
    required this.startAirport,
    required this.endAirport,
    required this.dateOfDeparture,
    required this.duration,
    required this.noOfSeats,
    required this.price
  });


  FlightModel.fromJson(Map<String, dynamic> json):
    flightName = json['flight_name'],
    cityOfArrival = json['city_of_arrival'],
    cityOfDeparture = json['city_of_departure'],
    startAirport = json['start_airport'],
    endAirport = json['end_airport'],
    dateOfDeparture = json['date_of_departure'],
    noOfSeats = json['no_of_seats'],
    duration = json['duration'],
    price = json['price'];
    

  // for getting data from firebase
  FlightModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    flightName = snapshot['flight_name'],
    cityOfArrival = snapshot['city_of_arrival'],
    cityOfDeparture = snapshot['city_of_departure'],
    startAirport = snapshot['start_airport'],
    endAirport = snapshot['end_airport'],
    dateOfDeparture = snapshot['date_of_departure'],
    noOfSeats = snapshot['no_of_seats'],
    duration = snapshot['duration'],
    price = snapshot['price'];


}