import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiModel {
  String carName;
  String driverName;
  String taxiLocation;
  int reviews;
  int noOfTripsTaken;
  String driverImage;


  TaxiModel({
    required this.carName,
    required this.driverName,
    required this.taxiLocation,
    required this.reviews,
    required this.noOfTripsTaken,
    required this.driverImage
  });


  TaxiModel.fromJson(Map<String, dynamic> json):
    carName = json['name'],
    driverName = json['driver'],
    taxiLocation = json['location'],
    reviews = json['reviews'],
    noOfTripsTaken = json['trips_taken'],
    driverImage = json['driver_image'];



  TaxiModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    carName = snapshot['name'],
    driverName = snapshot['driver'],
    taxiLocation = snapshot['location'],
    reviews = snapshot['reviews'],
    noOfTripsTaken = snapshot['trips_taken'],
    driverImage = snapshot['driver_image'];




  
}