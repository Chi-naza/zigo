
import 'package:cloud_firestore/cloud_firestore.dart';

class CarLeaseModel {
    String carName;
    String modelYear;
    String pricePerDay;
    String cityOfLocation;
    String noOfSeats;
    String image;

    CarLeaseModel({
      required this.carName,
      required this.modelYear,
      required this.pricePerDay,
      required this.cityOfLocation,
      required this.noOfSeats,
      required this.image
    });


    CarLeaseModel.fromJson(Map<String, dynamic> json):
      carName = json['name'],
      modelYear = json['model_year'],
      pricePerDay = json['price_per_day'],
      cityOfLocation = json['location'],
      noOfSeats = json['no_of_seats'],
      image = json['image'];

      

    CarLeaseModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
      carName = snapshot['name'],
      modelYear = snapshot['model_year'],
      pricePerDay = snapshot['price_per_day'],
      cityOfLocation = snapshot['location'],
      noOfSeats = snapshot['no_of_seats'],
      image = snapshot['image'];

    

    Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>();
      
      data['name'] = this.carName;
      data['model_year'] = this.modelYear;
      data['price_per_day'] = this.pricePerDay;
      data['location'] = this.cityOfLocation;
      data['no_of_seats'] = this.noOfSeats;
      data['image'] = this.image;


      return data;
    }




}