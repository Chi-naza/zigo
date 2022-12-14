import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/screens/budget/auto_budget_planner.dart';
import 'package:zigo/screens/budget/my_budget_lists.dart';
import 'package:zigo/screens/budget/plan_your_budget_screen.dart';
import 'package:zigo/screens/flight/flight_booking.dart';
import 'package:zigo/screens/hotel/hotel_list.dart';
import 'package:zigo/screens/map_screen.dart';
import 'package:zigo/screens/reservations.dart';
import 'package:zigo/screens/vehicle%20lease/boat_lease_list.dart';
import 'package:zigo/screens/vehicle%20lease/car_lease_list.dart';
import 'package:zigo/screens/weather/user_weather_details.dart';
import 'package:zigo/widgets/footer/zigo_bottom_navbar.dart';
import 'package:zigo/widgets/header/drawer_screen.dart';
import 'package:zigo/widgets/header/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController pageController=PageController();

  double _currPageValue=0;

  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        // Listening to page values as one slides through the pageView
        _currPageValue = pageController.page!;
      });
    });
  }


  // Creating a list of ImageUrls for our slide
  List<String> imageData = [
    'assets/images/h1.jpg',
    'assets/images/h2.jpg',
    'assets/images/h3.jpg',
    'assets/images/h4.jpg'
  ];

  // to dispose the data of pageController when one leaves the page
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // The main Header: i.e image & menu icon
            Header(),
            SizedBox(height: Dimensions.height25),
            // search container
            Container(
              height: Dimensions.height20*2,
              width: Dimensions.screenWidth-50,
              decoration: BoxDecoration(
                color: AppColors.zigoBackgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20/2),
              ),            
              child: Row(
                children: [
                  SizedBox(width: Dimensions.width10),
                  // the input field
                  Expanded(
                    child: TextField(
                      expands: true,
                      maxLines: null,                                                                               
                      decoration: InputDecoration(
                        hintText: 'Enter your words',
                        contentPadding: EdgeInsets.symmetric(vertical: Dimensions.height4),
                        hintStyle: GoogleFonts.montserrat(
                          color: AppColors.zigoGreyTextColor,                                          
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // the search icon
                  Container(
                    padding: EdgeInsets.all(Dimensions.height10),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                    ), 
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),       
                  ),                
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30),
            // SLIDE SHOW AREA
            Container(
              width: Dimensions.screenWidth-40,
              height: Dimensions.height50*4,
              child: PageView.builder(
                controller: pageController,
                itemCount: 4,
                itemBuilder: (context, position) {
                  return Container(
                    // height: Dimensions.pageViewContainer,
                    margin: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                    ),
                    decoration: BoxDecoration(                  
                      color: position.isEven ? Color(0xFF69c5df) : Color(0xFFfa7552),
                      image: DecorationImage(                      
                        image: AssetImage(imageData[position]),
                        fit: BoxFit.fill,
                      ),
                    )
                  );              
                },
              ),                 
            ),
            SizedBox(height: Dimensions.height10),
            // SLIDER DOTS
            DotsIndicator(
              dotsCount: 4,
              position: _currPageValue,
              decorator:  DotsDecorator(
                activeColor: AppColors.mainColor,
                size: Size.square(Dimensions.height10),
                activeSize: Size(Dimensions.height18, Dimensions.height12),
              ),
            ),
            SizedBox(height: Dimensions.height30),
            // The TABLE starts here
            Container(
              padding: EdgeInsets.all(Dimensions.height4),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(width: Dimensions.width4, color: AppColors.zigoBackgroundColor),
                  verticalInside: BorderSide(width: Dimensions.width4, color: AppColors.zigoGreyColor),
                ),
                children: [
                  // 1st table row
                  TableRow(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(PlanYourBudgetScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.next_plan, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Create Budget', textAlign: TextAlign.center,),                              
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const Reservations()),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.article, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Reservations', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          bool granted;
                           granted = await authController.requestUserToGrantLocationPermision();
                          if(granted){
                            Get.to(UserWeatherDetailsScreen());
                          }
                          
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.cloudy_snowing, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Weather Forecast', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),                
                  // 2nd table row
                  TableRow(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(AutoBudgetPlannerScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.hdr_auto, size: 20),
                              SizedBox(height: Dimensions.height10),
                              Text('Auto Budget Planner', textAlign: TextAlign.center,),                              
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          bool granted;
                           granted = await authController.requestUserToGrantLocationPermision();
                          if(granted){
                            Get.toNamed(MapScreen.routeName);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.near_me, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Map', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(HotelListScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.hotel, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Book Hotel', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),                
                  // 3rd table row
                  TableRow(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(CarLeaseListScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.car_rental, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Rent Car', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(FlightBookingScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.flight, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Book Flight', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(BoatLeaseListScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.sailing, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Rent Ship', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),                
                  // 4th table row
                  TableRow(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.explore, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Compass', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(MyBudgetListScreen.routeName),
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.shopping_bag, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('My Budgets', textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Column(
                            children: [
                              Icon(Icons.payment, size: 20,),
                              SizedBox(height: Dimensions.height10),
                              Text('Payment Gateway', textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),                
                ],
              ),
            ),
            SizedBox(height: Dimensions.height50),
          ],
        ),
      ),
      // Our Custom BottomNavBar
      bottomNavigationBar: const ZigoBottomNavBar(isHomeClicked: true),
    );
  }
}