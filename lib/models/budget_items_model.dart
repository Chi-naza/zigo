import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetItemsModel {
  String itemName;
  String itemPrice;


  BudgetItemsModel({
    required this.itemName,
    required this.itemPrice
  });


  BudgetItemsModel.fromJson(Map<String, dynamic> json) :
    itemName = json['item_name'],
    itemPrice = json['item_price'];


  BudgetItemsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) :
    itemName = snapshot['item_name'],
    itemPrice = snapshot['item_price'];



}