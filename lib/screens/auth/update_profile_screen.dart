import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/widgets/animations/zigo_loading.dart';
import 'package:zigo/widgets/custom_snackbar.dart';


class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
 

  var lastNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var addressController = TextEditingController();
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  var phoneNumberController = TextEditingController();

  AuthController authController = Get.find();

  var itemList = ["network", "Abuja"];
  var item = "network";

  // IMAGE UPLOAD
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  // selectFile (image) : function which prompts the user to select an image file
  Future<void> selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
          return authController.isLoading.value? const ZigoLoading() : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (Navigator.canPop(context))
                              Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: Dimensions.height30,
                          )),
                      Text(
                        'Update your details',
                        style: TextStyle(fontSize: Dimensions.height18),
                      ),
                      InkWell(
                        onTap: () async{
                          // if form is validated, we proceed to update our account
                          if(updateFormKey.currentState!.validate()){
                            // updateAccount method called here
                            await authController.updateAccountDetails(
                              pickedFile: pickedFile,
                              uploadTask: uploadTask,
                              fname: firstNameController.text.trim(),
                              lname: lastNameController.text.trim(),
                              address: addressController.text.trim(),
                              phoneNumber: phoneNumberController.text.trim()
                            );
                                                      
                            if(pickedFile !=null){
                              // print success message and get back to homeScrren
                              customSnackbar(
                                titleText: "Successful", 
                                bodyText: "You have now updated your account details"
                              );

                              authController.navigateToHomeScreen(); //to homeScreen
                            }                           
                            
                          }                                                    
                        }, 
                        child: Text(
                          "Update",
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.mainColor, fontSize: Dimensions.height16),
                        ),                       
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20*2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Date'),
                      Text(DateFormat.yMMMMd('en_US').format(DateTime.now()))                 
                    ],
                  ),
                  SizedBox(height: Dimensions.height20*2),
                  // First name
                  Form(
                    key: updateFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value?.trim() == "") return 'Required';
                            return null;
                          },
                          controller: firstNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                            ),
                            filled: true,
                          ),                 
                        ),
                        SizedBox(height: Dimensions.height20),
                        // Last Name
                        TextFormField(
                          validator: (value) {
                            if (value?.trim() == "") return 'Required';
                            return null;
                          },
                          controller: lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                            ),
                            filled: true,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        // Address 
                        TextFormField(
                          validator: (value) {
                            if (value?.trim() == "") return 'Required';
                            return null;
                          },
                          controller: addressController,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                            ),
                            filled: true,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        // Phone Number
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value?.trim() == "") {
                              return 'Required';
                            } else {
                              return null;
                            }
                          },
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                            ),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),              
                  SizedBox(height: Dimensions.height20),
                  // IMAGE UPLOAD container wrapped with gestureDetector
                  GestureDetector(
                    onTap: selectFile,
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.radius20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                      ),
                      child: Text(
                        "Add Profile Image",
                        style: TextStyle(
                          color: AppColors.mainWhiteColor,
                        ),
                      ),
                    ),
                  ),              
                  if(pickedFile != null) 
                    SizedBox(height: Dimensions.height4),               
                  if(pickedFile != null)                
                    Container(
                      alignment: Alignment.center,
                      // height: Dimensions.height50,
                      padding: EdgeInsets.all(Dimensions.height10),
                      width: Dimensions.screenWidth,
                      color: Colors.blue[200],
                      child: Text("${pickedFile!.name}", textAlign: TextAlign.center),
                    ),
                  SizedBox(height: Dimensions.height30),
                  // The Info at the bottom screen
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20/2)),
                      color: AppColors.mainColor.withOpacity(0.1), 
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Anyone can create an account',
                            style: TextStyle(
                                color: AppColors.mainColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nevertheless, we want you to add your real details, so that you can get the best out of our services without much hassle. Click update at the top right of the screen after filling in your details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.mainColor,
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
