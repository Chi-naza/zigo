
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/header/header_section.dart';

class PlanYourBudgetScreen extends StatefulWidget {
  const PlanYourBudgetScreen({Key? key}) : super(key: key);

  @override
  State<PlanYourBudgetScreen> createState() => _PlanYourBudgetScreenState();
}

class _PlanYourBudgetScreenState extends State<PlanYourBudgetScreen> {
  // dummy list for items
  String dropDownCurrentValue = 'Enter item';
  var items = ['Enter item', 'Hello', 'Dear', 'Ada', 'My love'];

  // dummy list for file types
  String currentFileType = '.Doc';
  var fileTypeList = ['.Doc', '.PDF', '.Png', '.Jpg', '.Xls'];

  bool saveToPhone = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(
              headerText: 'Plan Your Budget', 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // text ITEM
                    Text(
                      'ITEM',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                        letterSpacing: 2,
                      ),
                    ),
                    // Vertical divider
                    VerticalDivider(
                      color: AppColors.zigoGreyColor,
                      thickness: Dimensions.height9/7,
                      indent: Dimensions.height16,
                      endIndent: Dimensions.height16,
                    ),
                    // price
                    Text(
                      'PRICE',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: AppColors.zigoGreyTextColor,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                      width: Dimensions.screenWidth - 100,
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
                          // price
                          Text(
                            '5,000.23',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: AppColors.zigoGreyTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // The divider below Croaker Fish text
                Divider(
                  thickness: Dimensions.height9/8,
                  color: AppColors.zigoGreyColor,
                  endIndent: Dimensions.width20,
                  indent: Dimensions.width20,
                ),
                SizedBox(height: Dimensions.height16),
                // Row Containing Dropdown button Here and TextField!
                Row(
                  children: [
                    // more . . . icon
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: Dimensions.height20*1.5,
                    ),
                    // Containing Dropdown button with with textField
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
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
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
                          SizedBox(width: Dimensions.width10),
                          // the INPUT FIELD beside the DropDown Button
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.zigoGreyColor,
                                  ),
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
            SizedBox(height: Dimensions.height30),
            // total price container
            Container(
             margin: EdgeInsets.only(left: Dimensions.width50*4),
             padding: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.width30),
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   offset: Offset(1,2),
                   color: Colors.grey.withOpacity(0.6),
                   blurRadius: Dimensions.radius20/4,
                 ),
               ],
               color: AppColors.zigoBackgroundColor,
               borderRadius: BorderRadius.circular(Dimensions.radius15/3),
               border: Border.all(color: AppColors.zigoGreyColor),
             ),
             // column container the two texts
             child: Column(
               children: [
                 // amount
                 Text(
                   '5,000.23',
                   style: GoogleFonts.montserrat(
                     color: AppColors.mainColor,
                     fontWeight: FontWeight.bold,
                     fontSize: Dimensions.font23,
                   ),
                 ),
                 SizedBox(height: Dimensions.height4),
                 // total text
                 Text(
                   'Total',
                   style: GoogleFonts.montserrat(
                     color: AppColors.mainColor,
                     fontWeight: FontWeight.w500,                             
                   ),
                 ),
                 SizedBox(width: Dimensions.width15)
               ],
             ),
            ),
            SizedBox(height: Dimensions.height50),
            // The save button & the date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // date
                Text(
                  '10/28/22',
                  style: GoogleFonts.montserrat(
                     color: AppColors.zigoTextBlackColor,
                     fontWeight: FontWeight.w500,                             
                  ),
                ),
                // save button (with our custom app button)
                AppButton(
                  text: 'Save', 
                  onTap: (){
                    showDialog(
                      context: context, 
                      builder: (context) {
                        // Using custom statefulBuilder in order to allow setState to work for alertDialog
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius30)),
                              contentPadding: EdgeInsets.only(top: Dimensions.height10),                       
                              title: Center(
                                child: Text(
                                  'Save File',
                                  style: GoogleFonts.montserrat(                          
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.font23,                             
                                  ),
                                ),
                              ),
                              // dialog box CONTENT
                              content: Container(
                                color: AppColors.zigoBackgroundColor.withOpacity(0.1),
                                width: Dimensions.width50*9,
                                height: Dimensions.height50*4,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: Dimensions.width50*3.7),
                                      child: Text(
                                        'File Name:',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.zigoTextBlackColor,
                                          fontWeight: FontWeight.w700,                             
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height4),
                                    // the input field is here
                                    Container(
                                      height: Dimensions.height50,
                                      width: Dimensions.width50*6,
                                      color: AppColors.zigoBackgroundColor,
                                      child: Row(
                                        children: [
                                          VerticalDivider(
                                            color: AppColors.zigoGreyTextColor,
                                            thickness: 2,
                                            width: Dimensions.width20*2,
                                            indent: Dimensions.height12,
                                            endIndent: Dimensions.height12,
                                          ),
                                          // The text field
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
                                        ],
                                      ),
                                    ),
                                    // the checkbox and saveToPhone text
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // checkbox
                                        Checkbox(
                                          value: saveToPhone,                                         
                                          onChanged: (bool? value){
                                            setState(() {
                                              saveToPhone = value!;
                                            });
                                          },
                                        ),
                                        // text
                                        Text(
                                          'Save To My Phone',
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.zigoGreyColor, 
                                            fontSize: Dimensions.font12, 
                                            fontWeight: FontWeight.bold,                                                                      
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SHOWN: if Save To Phone is True
                                    if (saveToPhone)
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: Dimensions.width50*3.4),
                                            child: Text(
                                              'File Location:',
                                              style: GoogleFonts.montserrat(
                                                color: AppColors.zigoTextBlackColor,
                                                fontWeight: FontWeight.w700,                             
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: Dimensions.height4),
                                          // Container with FILE LOCATION eg LocalDisk/phone/doc/...
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                                            height: Dimensions.height50,
                                            width: Dimensions.width50*6,
                                            color: AppColors.zigoBackgroundColor,
                                            child: Center(
                                              child: Text(
                                                'Choose Where To Save Your Budget',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.montserrat(
                                                  color: AppColors.zigoGreyTextColor,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.font16-2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), // ShOWN ended
                                  ],
                                ),
                              ),  // end of first dialogBox Content
                              actions: [
                                Container(
                                  width: double.maxFinite,
                                  height: Dimensions.height50,
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
                                  // color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.pop(context),
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.zigoTextBlackColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimensions.font20-2,                         
                                          ),
                                        ),
                                      ),
                                      // Vertical Divider
                                      VerticalDivider(
                                        color: AppColors.zigoGreyTextColor,
                                        thickness: 4,
                                        width: Dimensions.width20*2,
                                        indent: Dimensions.height9,
                                        endIndent: Dimensions.height4,
                                      ),
                                      // Save AppButton with another Dialog box. Pops up When clicked
                                      InkWell(
                                        child: Text(
                                          'Save',
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.zigoTextBlackColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimensions.font20,                         
                                          ),
                                        ),
                                        onTap: (){
                                          // Removing the prev. dialog and initiating a new one with pop(context)
                                          Navigator.pop(context);
                                          showDialog(
                                            context: context, 
                                            builder: (context) {
                                              // Wrapping AlertDialog in Stateful Builder in order to activate setState()
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius30)),
                                                    contentPadding: EdgeInsets.only(top: Dimensions.height10),   
                                                    title:  Center(
                                                      child: Text(
                                                        'Save File',
                                                        style: GoogleFonts.montserrat(                          
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: Dimensions.font23,                             
                                                        ),
                                                      ),
                                                    ),
                                                    // dialog box CONTENT. One With File Location
                                                    content: Container(
                                                      color: AppColors.zigoBackgroundColor.withOpacity(0.1),
                                                      width: double.infinity,
                                                      height: Dimensions.height50*4,  
                                                      child: Column(
                                                        children: [
                                                          // Here's the container with FILE NAME text
                                                          Container(
                                                            margin: EdgeInsets.only(right: Dimensions.width50*3.7, top: Dimensions.height12),
                                                            child: Text(
                                                              'File Name:',
                                                              style: GoogleFonts.montserrat(
                                                                color: AppColors.zigoTextBlackColor,
                                                                fontWeight: FontWeight.w700,                             
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: Dimensions.height4),
                                                          // Container with FILE NAME & FILE TYPE eg docx, pdf. etc
                                                          Container(
                                                            height: Dimensions.height50,
                                                            width: Dimensions.width50*6,
                                                            color: AppColors.zigoBackgroundColor,
                                                            child: Row(
                                                              children: [
                                                                // The Vertical Divider 1
                                                                VerticalDivider(
                                                                  color: AppColors.zigoGreyTextColor,
                                                                  thickness: 2,
                                                                  width: Dimensions.width20*2,
                                                                  indent: Dimensions.height12,
                                                                  endIndent: Dimensions.height12,
                                                                ),
                                                                // The Text Bearing FILE NAME
                                                                Container(                                                          
                                                                  width: Dimensions.width50*3,
                                                                  child: Text(
                                                                    'Obudu Budget',
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: GoogleFonts.montserrat(
                                                                      color: AppColors.zigoGreyTextColor,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: Dimensions.font26/2,
                                                                    ),
                                                                  ),
                                                                ),
                                                                // The Vertical Divider 2
                                                                SizedBox(width: Dimensions.width4),
                                                                VerticalDivider(
                                                                  color: AppColors.zigoGreyTextColor,
                                                                  thickness: 2.2,
                                                                  width: Dimensions.width20*1.5,
                                                                  indent: Dimensions.height12,
                                                                  endIndent: Dimensions.height12,
                                                                ),
                                                                // DropDown Button which shows LIST of FILE TYPES eg. docx. pdf...
                                                                Expanded(
                                                                  child: Container(
                                                                    width: Dimensions.width20,
                                                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width4),
                                                                    child: DropdownButtonHideUnderline(
                                                                      child: DropdownButton(                            
                                                                        isExpanded: false,
                                                                        icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font20),  
                                                                        value: currentFileType,
                                                                        items: fileTypeList.map((e) {
                                                                          return DropdownMenuItem(value: e, child: Text(e));
                                                                        }).toList(), 
                                                                        onChanged: (String? newValue){
                                                                          setState(() {
                                                                            currentFileType = newValue!;
                                                                          });
                                                                        },
                                                                        style: GoogleFonts.montserrat(fontSize: Dimensions.font12, color: Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: Dimensions.height20),
                                                          // Here's the container with FILE LOCATION text
                                                          Container(
                                                            margin: EdgeInsets.only(right: Dimensions.width50*3.4),
                                                            child: Text(
                                                              'File Location:',
                                                              style: GoogleFonts.montserrat(
                                                                color: AppColors.zigoTextBlackColor,
                                                                fontWeight: FontWeight.w700,                             
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: Dimensions.height4),
                                                          // Container with FILE LOCATION eg LocalDisk/phone/doc/...
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
                                                            height: Dimensions.height50,
                                                            width: Dimensions.width50*6,
                                                            color: AppColors.zigoBackgroundColor,
                                                            child: Center(
                                                              child: Text(
                                                                'LocalDisk/Public/Documents/ Obuducattle ranch',
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: GoogleFonts.montserrat(
                                                                  color: AppColors.zigoGreyTextColor,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: Dimensions.font26/2,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ), // end of dialog content
                                                    // Action buttons
                                                    actions: [
                                                     Container(
                                                      width: double.maxFinite,
                                                      height: Dimensions.height50,
                                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                           InkWell(
                                                            onTap: () => Navigator.pop(context),
                                                            child: Text(
                                                              'Cancel',
                                                              style: GoogleFonts.montserrat(
                                                                color: AppColors.zigoTextBlackColor,
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: Dimensions.font20-2,                         
                                                              ),
                                                            ),
                                                          ),
                                                          // Vertical Divider
                                                          VerticalDivider(
                                                            color: AppColors.zigoGreyTextColor,
                                                            thickness: 4,
                                                            width: Dimensions.width20*2,
                                                            indent: Dimensions.height9,
                                                            endIndent: Dimensions.height4,
                                                          ),
                                                          // Save AppButton with another Dialog box. Pops up When clicked
                                                          InkWell(
                                                            child: Text(
                                                              'Save',
                                                              style: GoogleFonts.montserrat(
                                                                color: AppColors.zigoTextBlackColor,
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: Dimensions.font20,                         
                                                              ),
                                                            ),
                                                            onTap: (){}
                                                          ),
                                                        ],
                                                      ),
                                                     ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          );                                  
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                            );
                          },
                        );
                      }
                    );
                  },
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