import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/header.dart';
import 'package:zigo/widgets/header_section.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {

  PageController pageController=PageController();

  double _currPageValue=0;

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
            // The main Header: i.e image & menu icon
            Header(),
            SizedBox(height: Dimensions.height25),
            // search container
            Container(
              height: Dimensions.height45,
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
                    width: Dimensions.width20*3.2,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                    ), 
                    child: Icon(
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
                      image: const DecorationImage(                      
                        image: AssetImage('assets/images/action_new.png'),
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
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_box, size: 20,),
                            Text('Budget \nPlanner')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.settings, size: 20,),
                            Text('Reservations')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.cloudy_snowing, size: 20,),
                            Text('Weather \nForecast')
                          ],
                        ),
                      ),
                    ],
                  ),                
                  // 2nd table row
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.account_box, size: 20,),
                            Text('Compass')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.settings, size: 20,),
                            Text('Map')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.lightbulb_outline, size: 20,),
                            Text('Payment \nGateway')
                          ],
                        ),
                      ),
                    ],
                  ),                
                  // 3rd table row
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.account_box, size: 20,),
                            Text('Vacation \nPlanner')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.settings, size: 20,),
                            Text('Journal')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            Icon(Icons.lightbulb_outline, size: 20,),
                            Text('Translator')
                          ],
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
    );
  }
}