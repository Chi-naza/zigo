import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/controllers/budget_controller.dart';



class SelectBudgetItemsScreen extends StatelessWidget {
  const SelectBudgetItemsScreen({Key? key}) : super(key: key);

  static const String routeName = '/selected-budget-items';



  @override
  Widget build(BuildContext context) {
    AuthController gg = Get.find(); // testing
    print(" USER VALUE :${gg.getUser()!.email}"); // testing
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Items"),
        centerTitle: true,
        backgroundColor: AppColors.mainColorLight1,
        elevation: 0.0,
      ),
      body: GetBuilder<BudgetController>(builder: (budgetController) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: budgetController.budgetItemsList.length,
          itemBuilder: ((context, index) {
            var item = budgetController.budgetItemsList[index];

            budgetController.selectedFlag[index] = budgetController.selectedFlag[index]??false; // setting it false by default
            bool isSelected = budgetController.selectedFlag[index]!;
            
            return ListTile(
              onLongPress: () => budgetController.onLongPress(isSelected, index),
              onTap: () => budgetController.myOnTap(isSelected, index),
              title: Text(item.itemName),
              subtitle: Text("₦${item.itemPrice}"),
              leading: budgetController.buildSelectIcon(isSelected, item),
            );
          }),
        );
      }),
    );
  }


}