import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/reservations.dart';

class AuthController extends GetxController{
  // Instantiating a FireBase Auth and User
  late FirebaseAuth _auth;

  // Contains email, name, password etc . . .
  final _user = Rxn<User>();

  late Stream<User?> _authStateChanges;



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

    navigateToOnboarding(); // navigating to onBoarding
  }


  // function which takes user to Onboarding screens after the splash screen
  void navigateToOnboarding(){
    Get.offAllNamed(OnboardingScreen.routeName);
  }


  // SIGN UP function
  Future<void> register(String email,  password) async{
    try{
      // firebase function which creates user using email & pwd
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // calling this save function after registration
      await saveUserInFireStore(email);

      // snackbar for registration success
      Get.snackbar(
        "", 
        "",
        titleText: Text("Registration Success", style: authTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text("Welcome! \nYou are now one of us. Enjoy the ride", style: authTextStyle.copyWith(fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: AppColors.mainColorLight2,
      );

      // when successful, go to signIn page
      navigateToLoginScreen();

    }on FirebaseAuthException catch(e){
      // snackbar for registration failure 
      Get.snackbar(
        "", 
        "",
        titleText: Text("Account Creation Fialed", style: authTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text(e.toString(), style: authTextStyle.copyWith(fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

  }




  // Function which creates a user in the fireStore DB when registration is done
  saveUserInFireStore(String email){
    userRef.doc(email).set({
      "email" : email,
      "first_name" : " ",
      "last_name" : " ",
      "phone_number" : " ",
      "profile_image" : " ",
      "address" : " ",
    });

  }





  // SIGN UP function
  Future<void> login(String email,  password) async{
    try{
      // firebase function which signs in a user using email & pwd
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // snackbar for registration success
      Get.snackbar(
        "", 
        "",
        titleText: Text("Login Successful", style: authTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text("Welcome back!", style: authTextStyle.copyWith(fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: AppColors.mainColorLight2,
      );

      // when successful, go to homeScreen
      navigateToHomeScreen();

    }on FirebaseAuthException catch(e){
      // snackbar for registration failure 
      Get.snackbar(
        "", 
        "",
        titleText: Text("Login Fialed", style: authTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: Dimensions.font20-2)),
        messageText: Text(e.toString(), style: authTextStyle.copyWith(fontSize: Dimensions.font16)),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

  }





  // checking if a current user is loggedIn
  bool isLoggedIn(){
    return _auth.currentUser != null;
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
    Get.offAllNamed(Reservations.routeName);
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



  // Custom TextStyle for auth
  TextStyle authTextStyle = TextStyle(
    color: Colors.white,
  );


}