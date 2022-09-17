import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/budget_items_model.dart';

class BudgetController extends GetxController {

  final budgetItemsList = <BudgetItemsModel>[].obs;

  @override
  void onReady() {
  
    getAllBudgetItems();

    super.onReady();
  }




  Future<void> getAllBudgetItems() async{
    try{
      // getting docs of the budgetItems collection.
      QuerySnapshot<Map<String, dynamic>> itemsData = await budgetItemRef.get();

      final itemsList = itemsData.docs.map((e) => BudgetItemsModel.fromSnapshot(e)).toList();

      budgetItemsList.assignAll(itemsList);

      print("BUDGET ITEMS :::: $budgetItemsList");  //testing


    }catch (e){
      print("GET BUDGET ITEMS ERROR: $e");
    }

    
  }




}