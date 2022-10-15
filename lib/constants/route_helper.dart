import 'package:get/get.dart';
import 'package:zigo/controllers/boat_lease_controller.dart';
import 'package:zigo/controllers/budget_controller.dart';
import 'package:zigo/controllers/flight_controller.dart';
import 'package:zigo/controllers/hotel_controller.dart';
import 'package:zigo/controllers/car_lease_controller.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/Intro/splash_screen.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/budget/auto_budget_planner.dart';
import 'package:zigo/screens/budget/my_budget_lists.dart';
import 'package:zigo/screens/budget/plan_your_budget_screen.dart';
import 'package:zigo/screens/flight/flight_booking.dart';
import 'package:zigo/screens/home/zigo_home.dart';
import 'package:zigo/screens/hotel/hotel_list.dart';
import 'package:zigo/screens/map_screen.dart';
import 'package:zigo/screens/vehicle%20lease/boat_lease_list.dart';
import 'package:zigo/screens/vehicle%20lease/car_lease_list.dart';


class AppRoutes {

  static List<GetPage> routes = [
    // for splash screen
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fadeIn
    ),
    
    // onboarding screen
    GetPage(
      name: OnboardingScreen.routeName,
      page: () => OnboardingScreen(),
      transition: Transition.fadeIn
    ),

    // home screen
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
      transition: Transition.fadeIn
    ),

    // signIn
    GetPage(
      name: SignInScreen.routeName,
      page: () => SignInScreen(),
      transition: Transition.zoom,
    ),

    // signUp
    GetPage(
      name: SignUpScreen.routeName,
      page: () => SignUpScreen(),
      transition: Transition.zoom,
    ),

    // Plan Your budget
    GetPage(
      name: PlanYourBudgetScreen.routeName,
      page: () => const PlanYourBudgetScreen(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder((){
        Get.put(BudgetController());
      })
    ),

    // Hotel List
    GetPage(
      name: HotelListScreen.routeName,
      page: () => HotelListScreen(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder((){
        Get.put(HotelController());
      })
    ),

    // Flight Booking
    GetPage(
      name: FlightBookingScreen.routeName,
      page: () => FlightBookingScreen(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder((){
        Get.put(FlightController());
      })
    ),

    // Car Lease List
    GetPage(
      name: CarLeaseListScreen.routeName,
      page: () => CarLeaseListScreen(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder((){
        Get.put(CarLeaseController());
      })
    ),

    // Boat Lease List
    GetPage(
      name: BoatLeaseListScreen.routeName,
      page: () => BoatLeaseListScreen(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder((){
        Get.put(BoatLeaseController());
      })
    ),

    // Auto Budget Planner
    GetPage(
      name: AutoBudgetPlannerScreen.routeName,
      page: () => AutoBudgetPlannerScreen(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder((){
        Get.put(BudgetController());
      })
    ),

    // My Budgets
    GetPage(
      name: MyBudgetListScreen.routeName,
      page: () => MyBudgetListScreen(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder((){
        Get.put(BudgetController());
      })
    ),

    // Map Screen
    GetPage(
      name: MapScreen.routeName,
      page: () => MapScreen(),
      transition: Transition.circularReveal,
    ),

    
  ];



}