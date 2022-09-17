import 'package:cloud_firestore/cloud_firestore.dart';

class BoatLeaseModel {
  String name;
  String routeCities;
  double pricePerDay;
  String cityOfLocation;
  String image;


  BoatLeaseModel({
    required this.name,
    required this.routeCities,
    required this.pricePerDay,
    required this.cityOfLocation,
    required this.image
  });


  BoatLeaseModel.fromJson(Map<String, dynamic> json):
    name = json['name'],
    routeCities = json['route_cities'],
    pricePerDay = json['price_per_day'],
    cityOfLocation = json['location'],
    image = json['image'];


  BoatLeaseModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
      name = snapshot['name'],
      routeCities = snapshot['route_cities'],
      pricePerDay = snapshot['price_per_day'],
      cityOfLocation = snapshot['location'],
      image = snapshot['image'];




}