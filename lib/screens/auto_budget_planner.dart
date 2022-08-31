import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header_section.dart';

class AutoBudgetPlannerScreen extends StatefulWidget {
  AutoBudgetPlannerScreen({Key? key}) : super(key: key);

  @override
  State<AutoBudgetPlannerScreen> createState() => _AutoBudgetPlannerScreenState();
}

class _AutoBudgetPlannerScreenState extends State<AutoBudgetPlannerScreen> {
  // dummy list for items
  String dropDownCurrentValue = 'Enter item';
  var items = ['Enter item', 'Hello', 'Dear', 'Ada', 'My love'];

  // Slider
  double _sliderValue = 30000.0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              headerText: 'Auto-Budget',
              useShadowedContBelowDivider: true, 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // text ITEM
                    Text(
                      'Enter Budget Limit',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor.withOpacity(0.6),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Range SLider Section: Budget Limit Picker
            SfSlider(
              min: 50000,
              max: 500000,
              interval: 100000,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              // minorTicksPerInterval: 5,
              value: _sliderValue, 
              onChanged: (dynamic value) {
                setState(() {
                  _sliderValue = value;
                  print("CURRENT SLIDER VALUE: $_sliderValue ");
                });
              }
            ),
            SizedBox(height: Dimensions.height30),
            // Divider below Range Slider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
              child: Divider(
                height: Dimensions.height12,
                thickness: Dimensions.height9/6,
                color: AppColors.zigoGreyColor,
              ),
            ),
            SizedBox(height: Dimensions.height30),
            // Croaker fish section: wrappped with column (first row & divider beneath)
            Column(
              children: [
                Row(
                  children: [
                    // text with number
                    Text(
                      '  1.',
                      style: GoogleFonts.montserrat(),
                    ),
                    // items beside the number in a row
                    Container(
                      padding: EdgeInsets.only(left: Dimensions.width9),
                      width: Dimensions.screenWidth - 85,
                      height: Dimensions.height20*2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // text ITEM
                          Text(
                            'CROAKER FISH',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: AppColors.zigoGreyTextColor,
                            ),
                          ),
                          // Vertical divider
                          VerticalDivider(
                            color: AppColors.zigoGreyColor,
                            thickness: Dimensions.height9/7,
                            indent: Dimensions.height9,
                            endIndent: Dimensions.height9,
                          ),
                          //stars in a Row using List.generate()
                          Row(
                            children: List.generate(
                              //generate items(widgets)
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: Dimensions.height18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height16),
                // Row Containing More Icon, Dropdown button, and Stars!
                Row(
                  children: [
                    // more . . . icon
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: Dimensions.height20*1.5,
                    ),
                    // Containing Dropdown button with with Stars
                    Container(
                      padding: EdgeInsets.only(left: Dimensions.width9),
                      width: Dimensions.screenWidth - 50,
                      height: Dimensions.height20*2.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Decoration box specifically for decorating a box
                          DecoratedBox(
                            decoration: BoxDecoration(                            
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(1,2),
                                  color: AppColors.zigoGreyColor, //shadow for button
                                  blurRadius: 5
                                ),
                              ]
                            ),
                            // Container with Dropdown button wrapped with decoratedBox
                            child: Container(
                              color: AppColors.mainWhiteColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                // Wrapping dropdown button widget with this: to remove the persitent underline
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(                            
                                    isExpanded: false,
                                    icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                    value: dropDownCurrentValue,
                                    items: items.map((e) {
                                      return DropdownMenuItem(value: e, child: Text(e));
                                    }).toList(), 
                                    onChanged: (String? newValue){
                                      setState(() {
                                        dropDownCurrentValue = newValue!;
                                      });
                                    },
                                    style: GoogleFonts.montserrat(fontSize: Dimensions.font16, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ), 
                          SizedBox(width: Dimensions.width16),                       
                          // Vertical divider
                          VerticalDivider(
                            color: AppColors.zigoGreyColor,
                            thickness: Dimensions.height9/7,
                            indent: Dimensions.height9,
                            endIndent: Dimensions.height9,
                          ),
                          SizedBox(width: Dimensions.width30),
                          // STARS beside the DropDown Button
                          Expanded(
                            child: Row(
                              children: List.generate(
                                //generate items(widgets)
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.height18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            // Container having the add '+' icon
            Container(
              // shifting the icon with margin
              margin: EdgeInsets.only(right: Dimensions.width50*4),
              child: Icon(
                Icons.add,
                size: Dimensions.radius30*1.3,
                color: AppColors.zigoGreyColor,
              ),
            ),
            SizedBox(height: Dimensions.height50),
            // The Budget button & empty text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // date
                Text(
                  '',
                  style: GoogleFonts.montserrat(
                     color: AppColors.zigoTextBlackColor,
                     fontWeight: FontWeight.w500,                             
                  ),
                ),
                // save button (with our custom app button)
                AppButton(
                  text: 'Budget', 
                  onTap: (){}
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30), // Giving more space at the bottom of the screen
          ],
        ),
      ),
    );
  }
}