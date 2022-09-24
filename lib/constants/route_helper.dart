import 'package:get/get.dart';
import 'package:zigo/controllers/boat_lease_controller.dart';
import 'package:zigo/controllers/budget_controller.dart';
import 'package:zigo/controllers/flight_controller.dart';
import 'package:zigo/controllers/hotel_controller.dart';
import 'package:zigo/controllers/taxi_booking_controller.dart';
import 'package:zigo/controllers/car_lease_controller.dart';
import 'package:zigo/screens/Intro/onboarding/onboarding_screen.dart';
import 'package:zigo/screens/Intro/splash_screen.dart';
import 'package:zigo/screens/auth/signIn.dart';
import 'package:zigo/screens/auth/signup.dart';
import 'package:zigo/screens/budget/auto_budget_planner.dart';
import 'package:zigo/screens/budget/my_budget_lists.dart';
import 'package:zigo/screens/budget/plan_your_budget_screen.dart';
import 'package:zigo/screens/flight/flight_booking.dart';
import 'package:zigo/screens/hotel/hotel_list.dart';
import 'package:zigo/screens/reservations.dart';
import 'package:zigo/screens/vehicle/boat_lease_list.dart';
import 'package:zigo/screens/vehicle/car_lease_list.dart';
import 'package:zigo/screens/vehicle/request_for_trip.dart';

class AppRoutes {

  static List<GetPage> routes = [
    // for home screen
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fadeIn
    ),
    
    // onboarding screen
    GetPage(
      name: OnboardingScreen.routeName,
      page: () => OnboardingScreen(),
    ),

    // reservations: home
    GetPage(
      name: Reservations.routeName,
      page: () => Reservations(),
    ),

    // signIn
    GetPage(
      name: SignInScreen.routeName,
      page: () => SignInScreen(),
    ),

    // signUp
    GetPage(
      name: SignUpScreen.routeName,
      page: () => SignUpScreen(),
      transition: Transition.fadeIn,
    ),

    // Plan Your budget
    GetPage(
      name: PlanYourBudgetScreen.routeName,
      page: () => PlanYourBudgetScreen(),
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
      transition: Transition.downToUp,
      binding: BindingsBuilder((){
        Get.put(FlightController());
      })
    ),

    // Request for Trip
    GetPage(
      name: RequestForTrip.routeName,
      page: () => RequestForTrip(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder((){
        Get.put(TaxiBookingController());
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
      transition: Transition.leftToRightWithFade,
      binding: BindingsBuilder((){
        Get.put(BudgetController());
      })
    ),

    // My Budgets
    GetPage(
      name: MyBudgetListScreen.routeName,
      page: () => MyBudgetListScreen(),
      transition: Transition.leftToRightWithFade,
      binding: BindingsBuilder((){
        Get.put(BudgetController());
      })
    ),

    
  ];



}