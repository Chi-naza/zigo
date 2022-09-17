import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  String hotelName;
  int reviews;
  String city;
  String location;
  double price;
  int stars;
  String image;


  HotelModel({
    required this.hotelName,
    required this.reviews,
    required this.city,
    required this.location,
    required this.price,
    required this.stars,
    required this.image
  });



  HotelModel.fromJson(Map<String, dynamic> json):
    hotelName = json['hotel_name'],
    reviews = json['reviews'],
    city = json['city'],
    location = json['location'],
    price = json['price'],
    stars = json['stars'],
    image = json['image'];


  HotelModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    hotelName = snapshot['hotel_name'],
    reviews = snapshot['reviews'],
    city = snapshot['city'],
    location = snapshot['location'],
    price = snapshot['price'],
    stars = snapshot['stars'],
    image = snapshot['image'];

  
}