
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String firstName;
  String lastName;
  String? phoneNumber;
  String? profileImage;
  String? address;


  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.profileImage,
    this.address,
  });


  UserModel.fromJson(Map<String, dynamic> json):
    email = json['email'],
    firstName = json['first_name'],
    lastName = json['last_name'],
    phoneNumber = json['phone_number'],
    profileImage = json['profile_image'],
    address = json['address'];


  // for firebase  
  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    email = snapshot['email'],
    firstName = snapshot['first_name'],
    lastName = snapshot['last_name'],
    phoneNumber = snapshot['phone_number'],
    profileImage = snapshot['profile_image'],
    address = snapshot['address'];
  


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
