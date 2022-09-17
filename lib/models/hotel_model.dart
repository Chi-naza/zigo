import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  String hotelName;
  String reviews;
  String city;
  String location;
  String price;
  String stars;
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
    hotelName = json['name'],
    reviews = json['reviews'],
    city = json['city'],
    location = json['location'],
    price = json['price'],
    stars = json['stars'],
    image = json['image'];


  HotelModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    hotelName = snapshot['name'],
    reviews = snapshot['reviews'],
    city = snapshot['city'],
    location = snapshot['location'],
    price = snapshot['price'],
    stars = snapshot['stars'],
    image = snapshot['image'];

  
}