import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/home/zigo_home.dart';
import 'package:zigo/widgets/custom_snackbar.dart';

class AuthController extends GetxController{
  // Instantiating a FireBase Auth and User
  late FirebaseAuth _auth;

  // Contains email, name, password etc . . .
  final _user = Rxn<User>();

  late Stream<User?> _authStateChanges;

  // List containing userData
  late UserModel currentUserData;

  //checker boolean
  final isLoading = false.obs;



  // onReady(): called immediately the app starts running
  @override
  void onReady() {
    initializeAuth();
    super.onReady();
  }




  // function called immediately the app Starts: initializes all authentication data
  Future<void> initializeAuth() async {
    await Future.delayed(const Duration(seconds: 5));

    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();

    // checking if the current user is registered or exists
    _authStateChanges.listen((User? user){ 
      _user.value = user;
    });

    // Getting userData if user is loggedIn
    if(isLoggedIn()){
      await getUserDetails();
    }

    navigateToOnboarding(); // navigating to onBoarding

  }


  // function which takes user to Onboarding screens after the splash screen
  void navigateToOnboarding(){
    Get.offAllNamed(OnboardingScreen.routeName);
  }


  // SIGN UP function
  Future<void> register(String email,  password) async{
    try{
      isLoading.value = true;
      // firebase function which creates user using email & pwd
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
  
      // calling this save function after registration
      await saveUserInFireStore(email);

      // Getting available user details on signUp
      await getUserDetails();

      isLoading.value = false;

      // snackbar for registration success
      customSnackbar(
        titleText: "Registration Success", 
        bodyText: "Welcome! \nYou are now one of us. Enjoy the ride"
      );

      // when successful, go to signIn page
      navigateToLoginScreen();

    }on FirebaseAuthException catch(e){
      isLoading.value = false;
      // snackbar for registration failure 
      customSnackbar(
        titleText: "Account Creation Fialed", 
        bodyText: e.toString(),
        isError: true
      );
    }

  }




  // Function which creates a user in the fireStore DB when registration is done
  saveUserInFireStore(String email){

    UserModel userModel = UserModel(
      email: email, 
      firstName: '', 
      lastName: '',
      phoneNumber: '',
      profileImage: '', 
      address: '',
      dateRegistered:  DateFormat.yMd().add_jm().format(DateTime.now()), // eg 1/9/2021 2AM
    );

    // serializing it to Json and sending it to user collection in fireStore
    userRef.doc(email).set(userModel.toJson());

  }





  // SIGN UP function
  Future<void> login(String email,  password) async{
    try{
      isLoading.value = true;
      // firebase function which signs in a user using email & pwd
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      // Getting available user details on signUp
      await getUserDetails();

      isLoading.value = false;


      // snackbar for login success
      customSnackbar(
        titleText: "Login Successful", 
        bodyText: "Welcome back!"
      );

      // when successful, go to homeScreen
      navigateToHomeScreen();

    }on FirebaseAuthException catch(e){
      isLoading.value = false;
      // snackbar for login failure 
      customSnackbar(
        titleText: "Login Fialed", 
        bodyText: e.toString(),
        isError: true
      );
    }

  }





  // checking if a current user is loggedIn
  bool isLoggedIn(){
    return _auth.currentUser != null;
  }


  // Getting the CurrentUser
  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }


  // A function that takes a user to the logIn screen
  void navigateToLoginScreen(){
    Get.toNamed(SignInScreen.routeName);
  }

  // A function that takes a user to the SignUp screen
  void navigateToSignUpScreen(){
    Get.toNamed(SignUpScreen.routeName);
  }

  // A function that takes a user to the SignUp screen
  void navigateToHomeScreen(){
    Get.offAllNamed(HomeScreen.routeName);
  }



  // The main signOut function
  Future<void> signOut() async {
    try{
      await _auth.signOut(); 
      print("Loggout Successful !"); // testing
      navigateToLoginScreen();
    }on FirebaseAuthException catch(e){
      print("SignOut Error From FireBase: $e");
    }
  }



  // A function which will update userAccount Details
  Future<void> updateAccountDetails({required pickedFile, required uploadTask, required String fname, required String lname, required String address, required String phoneNumber}) async {
    try{

      if(pickedFile != null){
        isLoading.value = true;

        // Getting the doc we have online, so that we can update the portion we need
        DocumentSnapshot<Map<String, dynamic>> dataGotten = await userRef.doc('${getUser()!.email}').get(); 

        // some fields to be updated
        await dataGotten.reference.update({
          'first_name': fname,
          'last_name': lname,
          'address': address,
          'phone_number': phoneNumber,
          'profile_image': await uploadImageFile(pickedFile, uploadTask), // image returned from our uploadImage function
        });

        //getting updated user details
        await getUserDetails();

        isLoading.value = false;
    
      } else{
        isLoading.value = false;
        customSnackbar(
          titleText: "No Image Picked", 
          bodyText: "You have not selected any image yet. Select an image by tappin on 'Add Profile Image' button",
          isError: true
        );
      }

    }catch (e){
      customSnackbar(
        titleText: "Account Update Fialed", 
        bodyText: e.toString(),
        isError: true
      );
    }
  }




  // A function which gets current user's data/details from fireStore.
  Future<void> getUserDetails() async {
    try{
      DocumentSnapshot<Map<String, dynamic>> dataGotten = await userRef.doc('${getUser()!.email}').get();     
      
      if(dataGotten.exists){
        // data() converts gottenData to Map<String, dynamic> format
        Map<String, dynamic>? data = dataGotten.data();
        // deserializing the data gotten to our UserModel; through the instance of UserModel created
        currentUserData = UserModel.fromJson(data!);
      }
      
      print("THIS IS cuRRent USER Data: $currentUserData"); // testing

    }catch (e){
      print("GET USER DETAILS error: $e");
    }
  }




  // A function which uploads the picked image to the DB and returns the downloadURL
  Future<String> uploadImageFile(pickedFile, uploadTask) async{
    final path = "profile_images/${pickedFile!.name}";
    final file = File(pickedFile!.path!);

    // setting the upload path: path is the directory it will be uploaded to
    final ref = firebaseStorage.child(path);
    uploadTask = ref.putFile(file);

    // waiting for the completion of the upload. When complete we do something
    final snapshot = await uploadTask!.whenComplete(() {});

    // Getting the download url
    final downloadUrl = await snapshot.ref.getDownloadURL();
    print("Download Url: $downloadUrl"); // testing

    return downloadUrl;

  }



}