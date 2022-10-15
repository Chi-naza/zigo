
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/boat_lease_controller.dart';
import 'package:zigo/widgets/animations/zigo_loading.dart';
import 'package:zigo/widgets/car_lease_card.dart';
import 'package:zigo/widgets/footer/zigo_bottom_navbar.dart';
import 'package:zigo/widgets/header/drawer_screen.dart';
import 'package:zigo/widgets/header/header.dart';

class BoatLeaseListScreen extends StatelessWidget {
  
  BoatLeaseListScreen({Key? key}) : super(key: key);

  static const String routeName = '/vehicle-lease-list';

  BoatLeaseController boatLeaseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const DrawerScreen(),
      body: Obx(() {
          return boatLeaseController.boatLeaseDataList.isEmpty? const ZigoLoading() : SingleChildScrollView(
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
                              'BOAT LEASE',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.height18,
                                color: Colors.grey,
                              ),
                            ),
                            // search container
                            Container(
                              height: Dimensions.height20*2,
                              width: Dimensions.width50*4,
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
                // ROW of jetski, boat & cruise (in Padding)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // for Jetski
                      Container(
                        // height: Dimensions.height50*1.5,
                        width: Dimensions.height50*1.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A71DE).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/jetski.png'),
                            SizedBox(height: Dimensions.height9),
                            Text(
                              'Jetski',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF071695),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // for Boat
                      Container(
                        // height: Dimensions.height50*1.5,
                        // padding: EdgeInsets.all(Dimensions.height10),
                        width: Dimensions.height50*1.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A71DE).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/boat.png'),
                            SizedBox(height: Dimensions.height9),
                            Text(
                              'Boat',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF071695),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // for Cruise
                      Container(
                        // height: Dimensions.height50*1.5,
                        width: Dimensions.height50*1.5,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A71DE).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(Dimensions.radius15/1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/cruise.png'),
                            SizedBox(height: Dimensions.height9),
                            Text(
                              'Cruise',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF071695),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.font12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height30),
                // List of Vehicle Lease Card (with our Custom CarLeaseCard)
                GetBuilder<BoatLeaseController>(builder: ((controller) {
                  return Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: ((context, index) => SizedBox(height: Dimensions.height10)), 
                          itemCount: controller.boatLeaseDataList.length,
                          itemBuilder: ((context, index) {
                            var boat = controller.boatLeaseDataList[index];
                            return CarLeaseCard(
                              city: boat.cityOfLocation, // city
                              vehicleName: boat.name.toUpperCase(), // boat name
                              modelYear: '', // model year
                              price: boat.pricePerDay, // price 
                              vehicleImagePath: boat.image, // image
                              onTap: () => controller.rentBoat(boat.name, boat), // calling the rentBoat function
                            );
                          }),                 
                        ),
                      );
                    }
                  );
                })),           
              ],
            ),
          );
        }
      ),
      bottomNavigationBar:  const ZigoBottomNavBar(),
    );
  }
}