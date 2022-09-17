import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiModel {
  String carName;
  String driverFirstName;
  String driverLastName;
  String driverMidName;
  String taxiLocation;
  String rating;
  String noOfTripsTaken;
  String driverImage;


  TaxiModel({
    required this.carName,
    required this.driverFirstName,
    required this.driverMidName,
    required this.driverLastName,
    required this.taxiLocation,
    required this.rating,
    required this.noOfTripsTaken,
    required this.driverImage
  });


  TaxiModel.fromJson(Map<String, dynamic> json):
    carName = json['name'],
    driverFirstName = json['driver_fn'],
    driverMidName = json['driver_mn'],
    driverLastName = json['driver_ln'],
    taxiLocation = json['location'],
    rating = json['rating'],
    noOfTripsTaken = json['trips_taken'],
    driverImage = json['driver_image'];



  TaxiModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    carName = snapshot['name'],
    driverFirstName = snapshot['driver_fn'],
    driverMidName = snapshot['driver_mn'],
    driverLastName = snapshot['driver_ln'],
    taxiLocation = snapshot['location'],
    rating = snapshot['rating'],
    noOfTripsTaken = snapshot['trips_taken'],
    driverImage = snapshot['driver_image'];




  
}