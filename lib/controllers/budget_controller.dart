import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/budget_items_model.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/screens/budget/my_budget_lists.dart';

class BudgetController extends GetxController {

  final budgetItemsList = <BudgetItemsModel>[].obs;

  // BUDGET ITEMS SELECTION
  final selectedBudgetItemsList = <BudgetItemsModel>[].obs;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;



  // Getting authController instance
  AuthController _authController = Get.find(); 


  // Getting Saved Budget
  List<MyBudgetModel> mySavedBudgetList = [];

   // Auto Budget Items List
  final autoBudgetItemsList = <BudgetItemsModel>[].obs;
 






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


  //ITEM SELECTION
  // what happens if the listTile is tapped. The index of the selected item will be reset to disable selection
  // Also its selection mode will be set to false
  void myOnTap(bool isSelected, int index){
    // Only remove item if it has been seleced. i.e selectedIndex=true. If not already selected, onTap adds the item
    if(selectedFlag[index]!){
        selectedFlag[index] = !isSelected;
        isSelectionMode = selectedFlag.containsValue(true);
  
        // Adding selected item to the selected List
        selectedBudgetItemsList.remove(budgetItemsList[index]);
        print("Selected IEMS: $selectedBudgetItemsList"); // testing

        // rebuild
        update();
    }else{
      //TODO: go to detail page
        if(isSelectionMode){
          selectedFlag[index] = !isSelected;
          isSelectionMode = selectedFlag.containsValue(true);

          // Adding selected item to the selected List
          selectedBudgetItemsList.add(budgetItemsList[index]);
          print("Selected IEMS: $selectedBudgetItemsList"); // testing

          // rebuild
          update();   
        }   
    }
  }


  // When this is invoked, the item is selected. Using the selectFlag, the index of the item is set to true
  // selection mode will be set to true as well
  void onLongPress(bool isSelected, int index){
      selectedFlag[index] = !isSelected;
      // If there will be any true in the selectionFlag then 
      // selection Mode will be true
      isSelectionMode = selectedFlag.containsValue(true);
      // Adding selected item to the selected List
      selectedBudgetItemsList.add(budgetItemsList[index]);
      print("Selected IEMS: $selectedBudgetItemsList"); // testing

      // rebuild
      update();
  }


  // This returns the icon that will be show based on whether item is selected or not
  Widget buildSelectIcon(bool isSelected, BudgetItemsModel mapData){
    if(isSelectionMode){
      return Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank, color: AppColors.mainColorLight1,);
    }else{
      return CircleAvatar(child: Text(mapData.itemName[0]), backgroundColor: AppColors.mainColorLight3);
    }
  }


  // A function that gets total Amount for budget (Manual)
  String budgetTotalAmount(){
    final total = 0.0.obs;
    for(var item in selectedBudgetItemsList){
      double itemAmount = double.parse(item.itemPrice);
      total.value += itemAmount;
    }
    return selectedBudgetItemsList.isNotEmpty? total.toString() : '0.0';
  }

  // A function that gets total Amount for budget (Auto)
  String autoBudgetTotalAmount(){
    final total = 0.0.obs;
    for(var item in autoBudgetItemsList){
      double itemAmount = double.parse(item.itemPrice);
      total.value += itemAmount;
    }
    return autoBudgetItemsList.isNotEmpty? total.toString() : '0.0';
  }

  

  // A function that saves user's CREATED budgets in the Database
  Future<void> saveBudgetInDataBase(String budgetName) async{
    try{
      // FOR MANUALLY PREPARED BUDGET
      if(_authController.isLoggedIn() && selectedBudgetItemsList.isNotEmpty){
        // Creating a new list & decoding the BudgetItemModel instance and saving the actual data to the new list
        List modifiedList = [];
        for(var t in selectedBudgetItemsList){
          modifiedList.add({'item_name': t.itemName, 'item_price': t.itemPrice});
        }
        print("Modified List Here: $modifiedList"); // testing

        MyBudgetModel _myBudgetModel = MyBudgetModel(
          budgetName: budgetName, 
          totalAmount: budgetTotalAmount(), 
          createdAt: DateFormat.yMMMEd().format(DateTime.now()), 
          budgetItemsList: modifiedList,
        );

        // Takes MyBudgetModel instance and saves the given info to our FireStore DB (with userEmail as 'budgets' Doc Key)
        await userRef.doc('${_authController.getUser()!.email}').collection('budgets').doc(budgetName.toUpperCase()).set(_myBudgetModel.toJson());

        // Emptying the data lists
        selectedBudgetItemsList.clear();

        // Getting the saved budget Items from the DB which will help us to see our data when we navigate to the next screen
        await getMyBudgets();

        Get.snackbar(
          "", 
          "",
          titleText: Text("Saved Successfully", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
          messageText: Text("You have created a new budget called $budgetName", style: TextStyle(color: Colors.white,fontSize: Dimensions.font16)),
          colorText: Colors.white,
          backgroundColor: AppColors.mainColorLight2,
        );

        // navigate to MyBudgets List SCreen
        Get.to(() => MyBudgetListScreen());
      }

      // FOR AUTO GENERATED BUDGET
      if(_authController.isLoggedIn() && autoBudgetItemsList.isNotEmpty){
        // Creating a new list & decoding the BudgetItemModel instance and saving the actual data to the new list
        List modifiedList = [];
        for(var t in autoBudgetItemsList){
          modifiedList.add({'item_name': t.itemName, 'item_price': t.itemPrice});
        }
        print("Modified List Here: $modifiedList"); // testing

        MyBudgetModel _myBudgetModel = MyBudgetModel(
          budgetName: budgetName, 
          totalAmount: autoBudgetTotalAmount(), 
          createdAt: DateFormat.yMMMEd().format(DateTime.now()), 
          budgetItemsList: modifiedList,
        );

        // Takes MyBudgetModel instance and saves the given info to our FireStore DB (with userEmail as 'budgets' Doc Key)
        await userRef.doc('${_authController.getUser()!.email}').collection('budgets').doc(budgetName.toUpperCase()).set(_myBudgetModel.toJson());

        // Emptying the data lists
        autoBudgetItemsList.clear();

        // Getting the saved budget Items from the DB which will help us to see our data when we navigate to the next screen
        await getMyBudgets();

        Get.snackbar(
          "", 
          "",
          titleText: Text("Saved Successfully", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
          messageText: Text("You have created a new budget called $budgetName", style: TextStyle(color: Colors.white,fontSize: Dimensions.font16)),
          colorText: Colors.white,
          backgroundColor: AppColors.mainColorLight2,
        );

        // navigate to MyBudgets List SCreen
        Get.to(() => MyBudgetListScreen());
      }

    }catch (e){
      Get.snackbar(
        "", 
        "",
        titleText: Text("Budget Save failed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text(e.toString(), style: TextStyle(color: Colors.white, fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }
  }



  // A function which gets budgets the user has already created from the DataBase
  Future<void> getMyBudgets() async {

    try{
      // Getting User budgets from DB
      QuerySnapshot<Map<String, dynamic>> data = await userRef.doc('${_authController.getUser()!.email}').collection('budgets').get();

      final userBudget = data.docs.map((e) => MyBudgetModel.fromSnapshot(e)).toList();
      mySavedBudgetList.assignAll(userBudget);

      print("USER BUDGET FROM DB: $mySavedBudgetList"); // testing

    }catch(e){
      print("Get Budget From DB Error: $e");
    }

  }



  // A function which generates budget items automatically
  void generateAutoBudgetItems(double limitPrice){
    if(budgetItemsList.isNotEmpty){
      autoBudgetItemsList.clear();
      double amount = 0;
      for(var item in budgetItemsList){
        amount += double.parse(item.itemPrice);
        if(amount < limitPrice){
          autoBudgetItemsList.add(item);
        }
      }
    }
  }




}







// // FOR SELECT ALL FUNCTIONALITY

  // Widget _buildSelectAllButton() {
  //   // The button will be visible when the selectionMode is enabled. 
  //   if (isSelectionMode) {
  //   bool isFalseAvailable = selectedFlag.containsValue(false);  // check if all item is not selected
  //     return FloatingActionButton(
  //       onPressed: _selectAll,
  //       child: Icon(
  //         isFalseAvailable ? Icons.done_all : Icons.remove_done,
  //       ),
  //     );
  //   } else {
  //     return null;
  //   }
  // }

  // void _selectAll() {
  //   bool isFalseAvailable = selectedFlag.containsValue(false);
  //   // If false will be available then it will select all the checkbox
  //   // If there will be no false then it will de-select all
  //   selectedFlag.updateAll((key, value) => isFalseAvailable);
  //   setState(() {
  //     isSelectionMode = selectedFlag.containsValue(true);
  //   });
  // }