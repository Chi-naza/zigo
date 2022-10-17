import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/car_lease_controller.dart';
import 'package:zigo/widgets/animations/zigo_loading.dart';
import 'package:zigo/widgets/car_lease_card.dart';
import 'package:zigo/widgets/footer/zigo_bottom_navbar.dart';
import 'package:zigo/widgets/header/drawer_screen.dart';
import 'package:zigo/widgets/header/header.dart';

class CarLeaseListScreen extends StatelessWidget {

  CarLeaseListScreen({Key? key}) : super(key: key);

  static const String routeName = '/car-lease-list';

  CarLeaseController carLeaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerScreen(),
      body: Obx(() {
          return carLeaseController.carLeaseDataList.isEmpty? const ZigoLoading() : SingleChildScrollView(
            child: Column(
              children: [
                // The main Header: i.e image & menu icon
                Header(),
                SizedBox(height: Dimensions.height20*3),
                // Header text and Search bar
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width18, right: Dimensions.width15),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CAR LEASE',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.height20-2,
                                color: Colors.grey,
                                letterSpacing: 1,
                              ),
                            ),
                            // search container
                            Container(
                              height: Dimensions.height20*2,
                              width: Dimensions.width50*3,
                              decoration: BoxDecoration(
                                color: AppColors.zigoBackgroundColor,
                                borderRadius: BorderRadius.circular(Dimensions.radius20/4),
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
                                        hintText: '',
                                        hintStyle: GoogleFonts.montserrat(
                                          color: AppColors.zigoGreyTextColor,                                          
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  // the search icon
                                  Container(
                                    height: Dimensions.height50,
                                    width: Dimensions.width20*2,
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                    ), 
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),       
                                  ),                
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // here's the Divider (wrapped around padding)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
                  child: Divider(
                    height: Dimensions.height12,
                    thickness: Dimensions.height9/8,
                    color: AppColors.zigoGreyColor,
                  ),
                ),
                SizedBox(height: Dimensions.height30),
                //CAR LEASE LIST
                GetBuilder<CarLeaseController>(builder: (controller) {
                  return Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: ((context, index) => SizedBox(height: Dimensions.height10)), 
                          itemCount: controller.carLeaseDataList.length,
                          itemBuilder: ((context, index) {
                            var car = controller.carLeaseDataList[index];
                            return CarLeaseCard(
                              city: car.cityOfLocation, // city
                              vehicleName: car.carName.toUpperCase(), // car name
                              modelYear: car.modelYear, // model year
                              price: car.pricePerDay, // price 
                              vehicleImagePath: car.image, // image
                              onTap: () => controller.rentCar(car.carName, car), // calling our rentCar function
                            );
                          }),                 
                        ),
                      );
                    }
                  );
                }),         
                SizedBox(height: Dimensions.height30),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar:  const ZigoBottomNavBar(),
    );
  }
}

