import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header_section.dart';

class BookHotelDetailScreen extends StatefulWidget {
  const BookHotelDetailScreen({Key? key}) : super(key: key);

  @override
  State<BookHotelDetailScreen> createState() => _BookHotelDetailScreenState();
}

class _BookHotelDetailScreenState extends State<BookHotelDetailScreen> {
  PageController pageController=PageController();
  double _currPageValue=0;


  // DropDowns
  var typeOfRooms = ["choose room", "good Room", " bad room", "better room", "Hello", "last room"];
  String currRoom = "choose room";

  var numOfRooms = ["choose no.", "3", "4","10", "9", "15"];
  String roomNum = "choose no.";

  // Date Picker
  TextEditingController _startBookDateController = TextEditingController();
  DateTime startBookDate = DateTime.now();

  TextEditingController _endBookDateController = TextEditingController();
  DateTime endBookDate = DateTime.now();


  // show Date picker:  function - for startDate
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startBookDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100)
      );

    if (picked != null && picked != startBookDate) {
      setState(() {
        startBookDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _startBookDateController.text = date;
      });
    }
  }

  // show Date picker:  function - for endDate
  _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endBookDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100)
      );

    if (picked != null && picked != endBookDate) {
      setState(() {
        endBookDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _endBookDateController.text = date;
      });
    }
  }

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

  // to dispose the data of pageController when one leaves the page
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    
  }


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // head section
            HeaderSection(headerText: 'HOTELS', extraSpaceAfterHeader: false),
            // The Carousel
            Stack(
              children: [
                Container(
                  width: Dimensions.screenWidth,
                  height: Dimensions.height50*6,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 4,
                    itemBuilder: (context, position) {
                      return Container(
                        decoration: BoxDecoration(                  
                          color: position.isEven ? Colors.grey.withOpacity(0.3) : Colors.grey.withOpacity(0.7),
                          image: const DecorationImage(                      
                            image: AssetImage('assets/images/sunview_slide2.png'),
                            fit: BoxFit.fill,
                          ),
                        )
                      );              
                    },
                  ),                 
                ),
                // dots in the stack
                Positioned(
                  bottom: Dimensions.height30,
                  left: Dimensions.width50,
                  right: Dimensions.width50,
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: _currPageValue,
                    decorator:  DotsDecorator(
                      activeColor: AppColors.mainWhiteColor,
                      size: Size.square(Dimensions.height12),
                      activeSize: Size(Dimensions.height18, Dimensions.height16),
                    ),
                  ),
                ),
                // Container in the Stack: positioned in the stack
                Positioned(
                  top: Dimensions.height50*5.4,
                  child: Container(
                    height: Dimensions.height50*9,
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius30),
                        topRight: Radius.circular(Dimensions.radius30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Another container as a followUp of the curved conatiner in the stack: housing COLUMN of items.
            Container(
              height: Dimensions.height50*7,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
              margin: EdgeInsets.only(top: Dimensions.height4),
              child: Column(
                children: [
                  // Row hosuing hotel name and reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // hotel name and location
                      Column(
                        children: [
                          Text(
                            'Sunview Hotel',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font12*2,
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
                      // heart icon and review text
                      Column(
                        children: [                                   
                          Icon(
                            Icons.favorite,
                            size: Dimensions.font20*2,
                            color: Colors.redAccent,
                          ),
                          Text(
                            '475 Reviews',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font12,
                            ),
                          ),
                        ], 
                      ),
                    ],
                  ),
                  // Divider after the first row
                  Divider(
                    height: Dimensions.height12,
                    thickness: Dimensions.height9/8,
                    color: AppColors.zigoGreyColor,
                  ),
                  SizedBox(height: Dimensions.height20),
                  // Row for: TYPE OF ROOM & NUMBER OF ROOMS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [                      
                      // Type of Room
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // type of room TEXT
                          Text(
                            'Type of Room',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26/2,
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          // DropdownList wrapped in a Container widget
                          Container(
                            height: Dimensions.height20*2,
                            color: AppColors.zigoBackgroundColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                              // Wrapping dropdown button widget with this: to remove the persitent underline
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(                            
                                  isExpanded: false,
                                  icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                  value: currRoom,
                                  items: typeOfRooms.map((e) {
                                    return DropdownMenuItem(value: e, child: Text(e));
                                  }).toList(), 
                                  onChanged: (String? newValue){
                                    setState(() {
                                      currRoom = newValue!;
                                    });
                                  },
                                  style: GoogleFonts.montserrat(fontSize: Dimensions.font16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), 
                      SizedBox(width:Dimensions.width30),
                      // Number of Rooms
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // type of room TEXT
                          Text(
                            'Number of Rooms',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26/2,
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          // DropdownList wrapped in a Container widget
                          Container(
                            height: Dimensions.height20*2,
                            color: AppColors.zigoBackgroundColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                              // Wrapping dropdown button widget with this: to remove the persitent underline
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(                            
                                  isExpanded: false,
                                  icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                  value: roomNum,
                                  items: numOfRooms.map((e) {
                                    return DropdownMenuItem(value: e, child: Text(e));
                                  }).toList(), 
                                  onChanged: (String? newValue){
                                    setState(() {
                                      roomNum = newValue!;
                                    });
                                  },
                                  style: GoogleFonts.montserrat(fontSize: Dimensions.font16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), 
                    ],
                  ),
                  SizedBox(height: Dimensions.height30),
                  // ROW for: BOOK from & TO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // COLUMN FOR: Book FROM
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // book From TEXT
                          Text(
                            'Book From',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26/2,
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          // The text Field & DatePicker
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            // AbsorbPointer widget to disable tap or on the textField
                            child: AbsorbPointer(
                              child:  Container(
                                height: Dimensions.height20*2,
                                width: Dimensions.width50*2.9,
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
                                        controller: _startBookDateController,
                                        expands: true,
                                        maxLines: null,                                                                               
                                        decoration: InputDecoration(
                                          hintText: 'start date',
                                          hintStyle: GoogleFonts.montserrat(
                                            color: AppColors.zigoGreyTextColor,                                          
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    // the calendar icon
                                    Container(
                                      height: Dimensions.height50,
                                      width: Dimensions.width20*2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                      ), 
                                      child: Icon(
                                        Icons.calendar_today,
                                        // color: ,
                                      ),       
                                    ),                
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), //end of Book From
                      SizedBox(width:Dimensions.width30),
                      // COLUMN FOR: Book TO
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // book From TEXT
                          Text(
                            'To',
                            style: GoogleFonts.montserrat(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26/2,
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          // The text Field & DatePicker
                          GestureDetector(
                            onTap: () => _selectEndDate(context),
                            // AbsorbPointer widget to disable tap or on the textField
                            child: AbsorbPointer(
                              child:  Container(
                                height: Dimensions.height20*2,
                                width: Dimensions.width50*2.9,
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
                                        controller: _endBookDateController,
                                        expands: true,
                                        maxLines: null,                                                                               
                                        decoration: InputDecoration(
                                          hintText: 'end date',
                                          hintStyle: GoogleFonts.montserrat(
                                            color: AppColors.zigoGreyTextColor,                                          
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    // the calendar icon
                                    Container(
                                      height: Dimensions.height50,
                                      width: Dimensions.width20*2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                      ), 
                                      child: Icon(
                                        Icons.calendar_today,
                                        // color: ,
                                      ),       
                                    ),                
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), // end of Book TO
                    ],
                  ),
                  SizedBox(height: Dimensions.height30),
                  // The Row for AMOUNT & BOOK NOW                   
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [                        
                        // Amount
                        Text(
                          'N35,000',
                          style: GoogleFonts.montserrat(
                            color: AppColors.zigoGreyTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.font20-2,                         
                          ),
                        ),
                        // Book no BUTTON
                        AppButton(text: "Book Now", onTap: (){},),
                      ],
                    ),
                  ),
                  // SizedBox(height: Dimensions.height50*3), // Space at the bottom of the page
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}