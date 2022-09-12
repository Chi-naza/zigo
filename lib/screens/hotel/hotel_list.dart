import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header/header.dart';
import 'package:zigo/widgets/hotel_list_tile.dart';

class HotelListScreen extends StatefulWidget {
  HotelListScreen({Key? key}) : super(key: key);

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {

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
                          width: Dimensions.width50*5,
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
            // Parent Container for the PageView
            Container(
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
                itemCount: 3,
                itemBuilder: (context, position) {
                  // Container generated for each item by PageView builder
                  return Container(
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
                            color: position.isEven ? Color(0xFF69c5df) : Color(0xFFfa7552),
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            image: const DecorationImage(                      
                              image: AssetImage('assets/images/sunview_slide.png'),
                              fit: BoxFit.fill,
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
                                  Text(
                                    'Sunview Hotel',
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.zigoGreyTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.font20-1,
                                    ),
                                  ),
                                  Row(                                  
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.zigoGreyTextColor,
                                      ),
                                      Text(
                                        'Ikeja, Lagos',
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
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color: AppColors.starColor,
                                        size: Dimensions.height18,
                                      ),
                                    ),
                                  ),
                                  // amount
                                  Text(
                                    '35,000',
                                    style: GoogleFonts.montserrat(
                                      color: AppColors.zigoGreyTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.font23,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );              
                },
              ),                 
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
            // LIST of HOTELS (with custom HotelTile)
            // sunview
            const HotelListTile(
              imagePath: 'assets/images/sunview_hotel.png', 
              hotelName: 'Sunview Hotel', 
              hotelLocation: 'Ikeja, Lagos', 
              price: '35,000', 
              numOfReviews: '173'
            ),
            SizedBox(height: Dimensions.height15),
            // jerry
            const HotelListTile(
              imagePath: 'assets/images/jerry_hotel.png', 
              hotelName: 'Jerry Hotel', 
              hotelLocation: 'Ikeja, Lagos', 
              price: '35,000', 
              numOfReviews: '173'
            ),
            SizedBox(height: Dimensions.height15),
            // Eko
            const HotelListTile(
              imagePath: 'assets/images/eko_hotel.png', 
              hotelName: 'Eko Hotel', 
              hotelLocation: 'Ikeja, Lagos', 
              price: '35,000', 
              numOfReviews: '173'
            ),
            SizedBox(height: Dimensions.height50),
          ],
        ),
      ),
    );
  }
}