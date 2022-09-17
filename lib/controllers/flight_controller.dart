import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/flight_model.dart';

class FlightController extends GetxController {

  final flightDataList = <FlightModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    getFlightData();
    super.onReady();
  }


  Future<void> getFlightData() async {
    try{
      QuerySnapshot<Map<String, dynamic>> data = await flightDataRef.get();

      final itemList = data.docs.map((e) => FlightModel.fromSnapshot(e)).toList();
      
      flightDataList.assignAll(itemList);

    }catch (e){
      print("FLIGHT GET DATA ERROR :: $e");
    }
  }
}