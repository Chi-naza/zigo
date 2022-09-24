import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zigo/firebase%20references/references.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/reservations.dart';
import 'package:zigo/widgets/custom_snackbar.dart';

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
      customSnackbar(
        titleText: "Registration Success", 
        bodyText: "Welcome! \nYou are now one of us. Enjoy the ride"
      );

      // when successful, go to signIn page
      navigateToLoginScreen();

    }on FirebaseAuthException catch(e){
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

      // snackbar for login success
      customSnackbar(
        titleText: "Login Successful", 
        bodyText: "Welcome back!"
      );

      // when successful, go to homeScreen
      navigateToHomeScreen();

    }on FirebaseAuthException catch(e){
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



}