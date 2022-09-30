import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/hotel_controller.dart';
import 'package:zigo/screens/hotel/book_hotel_detail_screen.dart';
import 'package:zigo/widgets/header/header.dart';
import 'package:zigo/widgets/hotel_list_tile.dart';

class HotelListScreen extends StatefulWidget {
  HotelListScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel-list';

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {

  HotelController hotelController = Get.find();

  PageController _pageController = PageController();
  double _currentPageValue = 0;

  // Overriding the initState and changing our _currentpageValue dynamically with setState
  // pageValue changes as one slides the items of the pageView
  @override
  void initState(){
    super.initState();
    _pageController.addListener(() { 
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  // Disposing our pageController when we are done interacting with the screen
  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          'HOTELS',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.height20,
                            color: Colors.grey,
                            letterSpacing: 1,
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
                                    hintText: 'Enter file name',
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
                                child: const Icon(
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
            SizedBox(height: Dimensions.height12),
            // text: hotels near me & loaction icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.zigoGreyTextColor,
                ),
                Text(
                  'Hotels Near Me',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height12),
            // PageView Slide Section
            // Parent Container for the PageView (Wrapped with  Obx)
            Obx(() {
                return Container(
                  width: Dimensions.screenWidth-120,
                  height: Dimensions.height50*5.8,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                     boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 3),
                        color: AppColors.zigoGreyColor,
                        blurRadius: Dimensions.height9,
                      ),
                    ]
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: hotelController.hotelList.length,
                    itemBuilder: (context, index) {
                      var hotel = hotelController.hotelList[index];
                      // Container generated for each item by PageView builder
                      return GestureDetector(
                        onTap: () {
                          Get.to((){
                            return BookHotelDetailScreen(hotelModel: hotel); // going to detailPage on a tap
                          });
                        },
                        child: Container(
                          // giving space between one pageView item and another with margin
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                          decoration: BoxDecoration(     
                            color: Colors.white,             
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 3),
                                color: AppColors.zigoGreyColor,
                                blurRadius: Dimensions.height9,
                              ),
                            ]
                          ),              
                          child: Column(
                            children: [
                              // The Image in the Container
                              Container(
                                height: Dimensions.height50*4,
                                width: double.infinity,
                                decoration: BoxDecoration(                  
                                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFFfa7552),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  image: DecorationImage(                      
                                    image: NetworkImage(hotel.image), //hotel image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Row with columns of texts below the image (wrapped with container)
                              Container(
                                margin: EdgeInsets.only(top: Dimensions.height20),
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // first column of text inside the row
                                    Column(
                                      children: [
                                        Container(
                                          width: Dimensions.width50*2.2,
                                          child: Text(
                                            hotel.hotelName, //hotel name
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                              color: AppColors.zigoGreyTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.font16+2,
                                            ),
                                          ),
                                        ),
                                        Row(                                  
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: AppColors.zigoGreyTextColor,
                                              size: Dimensions.height12+2,
                                            ),
                                            Text(
                                              "${hotel.location}, ${hotel.city}",  // hotel location
                                              style: GoogleFonts.montserrat(
                                                color: AppColors.zigoGreyTextColor,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ], 
                                    ),
                                    // 2nd column of text inside the row. One with stars & Amount
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //stars in a Row using List.generate()
                                        Row(
                                          children: List.generate(
                                            //generate items(widgets)
                                            int.parse(hotel.stars),  // hotel rating
                                            (index) => Icon(
                                              Icons.star,
                                              color: AppColors.starColor,
                                              size: Dimensions.height12+2,
                                            ),
                                          ),
                                        ),
                                        // amount
                                        Text(
                                          hotel.price, // hotel price
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.zigoGreyTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.font20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );              
                    },
                  ),                 
                );
              }
            ),
            SizedBox(height: Dimensions.height10),
            // SLIDER DOTS
            DotsIndicator(
              dotsCount: 3,
              position: _currentPageValue,
              decorator:  DotsDecorator(
                color: AppColors.zigoBackgroundColor,
                activeColor: AppColors.zigoTextBlackColor,
                size: Size.square(Dimensions.height10),
                activeSize: Size(Dimensions.height18, Dimensions.height12),
              ),
            ),
            SizedBox(height: Dimensions.height30),
            GetBuilder<HotelController>(builder: ((controller) {
              return Obx(() {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      var hotel = controller.hotelList[index];
                      return GestureDetector(
                        onTap: () {
                           Get.to((){
                            return BookHotelDetailScreen(hotelModel: hotel); // going to detailPage on a tap
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                          child: HotelListTile(
                            imagePath: hotel.image, // hotel image
                            hotelName: hotel.hotelName, // hotel name
                            hotelLocation: "${hotel.location}, ${hotel.city}", // hotel location
                            price: hotel.price, //hotel price
                            numOfReviews: hotel.reviews, // hotel reviews
                          ),
                        ),
                      );
                    }), 
                    separatorBuilder: ((context, index) => SizedBox(height: Dimensions.height20)), 
                    itemCount: controller.hotelList.length,
                  );
                }
              );
            })),
            SizedBox(height: Dimensions.height50)
          ],
        ),
      ),
    );
  }
}