import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/screens/budget/auto_budget_planner.dart';
import 'package:zigo/screens/budget/budget_details.dart';
import 'package:zigo/screens/budget/my_budget_lists.dart';
import 'package:zigo/screens/budget/plan_your_budget_screen.dart';
import 'package:zigo/screens/flight/flight_booking.dart';
import 'package:zigo/screens/hotel/hotel_list.dart';
import 'package:zigo/screens/vehicle/boat_lease_list.dart';
import 'package:zigo/screens/vehicle/car_lease_list.dart';
import 'package:zigo/screens/vehicle/request_for_trip.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // for drawer background color
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              title: Text(
                'Ugwuoke Chinaza',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                "You wouldn't get it until you register",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ),

            // Testing Buttons
            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => Get.toNamed(PlanYourBudgetScreen.routeName), 
              child: Text("Plan Your Budget Screen")
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(HotelListScreen.routeName), 
              child: Text("Hotel List Screen")
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(FlightBookingScreen.routeName), 
              child: Text("Book Flight Screen Now")
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(RequestForTrip.routeName), 
              child: Text("Request For Trip")
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(CarLeaseListScreen.routeName), 
              child: Text("Car List Screen")
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(BoatLeaseListScreen.routeName), 
              child: Text("Book Vehicle List Screen")
            ),

            ElevatedButton(
              onPressed: () => Get.to(() => MyBudgetListScreen()), 
              child: Text("View My Budgets"),
            ),

            ElevatedButton(
              onPressed: () => Get.toNamed(AutoBudgetPlannerScreen.routeName), 
              child: Text("Automatic Budget Planner"),
            ),

          ],
        ),
      ),
    );
  }
}