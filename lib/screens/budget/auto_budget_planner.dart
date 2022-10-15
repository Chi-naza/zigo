import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/budget_controller.dart';
import 'package:zigo/widgets/animations/zigo_loading.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/budget_items_row.dart';
import 'package:zigo/widgets/footer/zigo_bottom_navbar.dart';
import 'package:zigo/widgets/header/header_section.dart';


class AutoBudgetPlannerScreen extends StatefulWidget {
  AutoBudgetPlannerScreen({Key? key}) : super(key: key);

  static const String routeName = '/auto-budget-planner';

  @override
  State<AutoBudgetPlannerScreen> createState() => _AutoBudgetPlannerScreenState();
  
}

class _AutoBudgetPlannerScreenState extends State<AutoBudgetPlannerScreen> {

   BudgetController budgetController = Get.find();
   
  // dummy list for items: FOR DROPDOWN
  // String dropDownCurrentValue = 'Enter item';
  // var items = ['Enter item', 'Hello', 'Dear', 'Ada', 'My love'];

  // dummy list for file types
  String currentFileType = '.Doc';
  var fileTypeList = ['.Doc', '.PDF', '.Png', '.Jpg', '.Xls'];

  // Checking if user wants to save budget to phone storage
  bool saveToPhone = false;

  // Slider
  double _sliderValue = 3000.0;

  // TEXT CONTROLLERS
  var _budgetNameController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
          return budgetController.budgetItemsList.isEmpty? const ZigoLoading() : SingleChildScrollView(
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
                  min: 3000,
                  max: 20000,
                  interval: 5000,
                  minorTicksPerInterval: 1,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  value: _sliderValue, 
                  onChanged: (dynamic value) {
                    setState(() {
                      _sliderValue = value;
                      print("CURRENT SLIDER VALUE: $_sliderValue ");// testings
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
                // AUTO GENERATED ITEMS ARE SHOWN HERE
                Obx(() =>  ListView.builder(
                  shrinkWrap: true,
                  itemCount: budgetController.autoBudgetItemsList.length,
                  itemBuilder: ((context, index) {
                    var item = budgetController.autoBudgetItemsList[index];
                    return BudgetItemRow(
                      itemNumber: index + 1, 
                      itemName: item.itemName, 
                      itemPrice: item.itemPrice,
                    );
                  }),
                )),
                SizedBox(height: Dimensions.height30),            
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: Text(
                    "Your limit amount is #${_sliderValue.round()}.  To see the auto generated items for your budget simply click  on the icon below",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: Dimensions.font23,
                      color: AppColors.zigoBackgroundColor,
                    ),
                  ),
                ),
                // Column(
                //   children: [
                //     Row(
                //       children: [
                //         // text with number
                //         Text(
                //           '  1.',
                //           style: GoogleFonts.montserrat(),
                //         ),
                //         // items beside the number in a row
                //         Container(
                //           padding: EdgeInsets.only(left: Dimensions.width9),
                //           width: Dimensions.screenWidth - 85,
                //           height: Dimensions.height20*2,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               // text ITEM
                //               Text(
                //                 'CROAKER FISH',
                //                 style: GoogleFonts.montserrat(
                //                   fontWeight: FontWeight.bold,
                //                   color: AppColors.zigoGreyTextColor,
                //                 ),
                //               ),
                //               // Vertical divider
                //               VerticalDivider(
                //                 color: AppColors.zigoGreyColor,
                //                 thickness: Dimensions.height9/7,
                //                 indent: Dimensions.height9,
                //                 endIndent: Dimensions.height9,
                //               ),
                //               //stars in a Row using List.generate()
                //               Row(
                //                 children: List.generate(
                //                   //generate items(widgets)
                //                   5,
                //                   (index) => Icon(
                //                     Icons.star,
                //                     color: AppColors.mainColor,
                //                     size: Dimensions.height18,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: Dimensions.height16),
                //     // Row Containing More Icon, Dropdown button, and Stars!
                //     Row(
                //       children: [
                //         // more . . . icon
                //         Icon(
                //           Icons.more_vert,
                //           color: Colors.grey,
                //           size: Dimensions.height20*1.5,
                //         ),
                //         // Containing Dropdown button with with Stars
                //         Container(
                //           padding: EdgeInsets.only(left: Dimensions.width9),
                //           width: Dimensions.screenWidth - 50,
                //           height: Dimensions.height20*2.2,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               // Decoration box specifically for decorating a box
                //               DecoratedBox(
                //                 decoration: BoxDecoration(                            
                //                   borderRadius: BorderRadius.circular(5),
                //                   boxShadow: <BoxShadow>[
                //                     BoxShadow(
                //                       offset: Offset(1,2),
                //                       color: AppColors.zigoGreyColor, //shadow for button
                //                       blurRadius: 5
                //                     ),
                //                   ]
                //                 ),
                //                 // Container with Dropdown button wrapped with decoratedBox
                //                 child: Container(
                //                   color: AppColors.mainWhiteColor,
                //                   child: Padding(
                //                     padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                //                     // Wrapping dropdown button widget with this: to remove the persitent underline
                //                     child: DropdownButtonHideUnderline(
                //                       child: DropdownButton(                            
                //                         isExpanded: false,
                //                         icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                //                         value: dropDownCurrentValue,
                //                         items: items.map((e) {
                //                           return DropdownMenuItem(value: e, child: Text(e));
                //                         }).toList(), 
                //                         onChanged: (String? newValue){
                //                           setState(() {
                //                             dropDownCurrentValue = newValue!;
                //                           });
                //                         },
                //                         style: GoogleFonts.montserrat(fontSize: Dimensions.font16, color: Colors.black),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ), 
                //               SizedBox(width: Dimensions.width16),                       
                //               // Vertical divider
                //               VerticalDivider(
                //                 color: AppColors.zigoGreyColor,
                //                 thickness: Dimensions.height9/7,
                //                 indent: Dimensions.height9,
                //                 endIndent: Dimensions.height9,
                //               ),
                //               SizedBox(width: Dimensions.width30),
                //               // STARS beside the DropDown Button
                //               Expanded(
                //                 child: Row(
                //                   children: List.generate(
                //                     //generate items(widgets)
                //                     5,
                //                     (index) => Icon(
                //                       Icons.star,
                //                       color: AppColors.mainColor,
                //                       size: Dimensions.height18,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(height: Dimensions.height20),
                // Container having the add '+' icon (wrapped with Inkwell)
                InkWell(
                  onTap: () => budgetController.generateAutoBudgetItems(_sliderValue), // calling our auto-generate function
                  child: Container(
                    // shifting the icon with margin
                    margin: EdgeInsets.only(right: Dimensions.width50*4),
                    child: Icon(
                      Icons.add,
                      size: Dimensions.radius30*1.3,
                      color: AppColors.zigoGreyColor,
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height50),
                // CREATE BUDGET BUTTON & TIME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // date
                    Text(
                      DateFormat.yMMMEd().format(DateTime.now()), // formatted DateTime
                      style: GoogleFonts.montserrat(
                         color: AppColors.zigoTextBlackColor,
                         fontWeight: FontWeight.w500,                             
                      ),
                    ),
                    // Create Budget button (with our custom app button)
                    AppButton(
                      text: 'Create Budget', 
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
                                    height: Dimensions.height50*4,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: Dimensions.height20),
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
                                                  textInputAction: TextInputAction.done,
                                                  controller: _budgetNameController,                                                                               
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter budget name',
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
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     // checkbox
                                        //     Checkbox(
                                        //       value: saveToPhone,                                         
                                        //       onChanged: (bool? value){
                                        //         setState(() {
                                        //           saveToPhone = value!;
                                        //         });
                                        //       },
                                        //     ),
                                        //     // text
                                        //     Text(
                                        //       'Save To My Phone',
                                        //       style: GoogleFonts.montserrat(
                                        //         color: AppColors.zigoGreyColor, 
                                        //         fontSize: Dimensions.font12, 
                                        //         fontWeight: FontWeight.bold,                                                                      
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        // SHOWN: if Save To Phone is True
                                        // if (saveToPhone)
                                        //   Column(
                                        //     children: [
                                        //       Container(
                                        //         margin: EdgeInsets.only(right: Dimensions.width50*3.4),
                                        //         child: Text(
                                        //           'File Location:',
                                        //           style: GoogleFonts.montserrat(
                                        //             color: AppColors.zigoTextBlackColor,
                                        //             fontWeight: FontWeight.w700,                             
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       SizedBox(height: Dimensions.height4),
                                        //       // Container with FILE LOCATION eg LocalDisk/phone/doc/...
                                        //       Container(
                                        //         padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                                        //         height: Dimensions.height50,
                                        //         width: Dimensions.width50*6,
                                        //         color: AppColors.zigoBackgroundColor,
                                        //         child: Center(
                                        //           child: Text(
                                        //             'Choose Where To Save Your Budget',
                                        //             maxLines: 1,
                                        //             overflow: TextOverflow.ellipsis,
                                        //             style: GoogleFonts.montserrat(
                                        //               color: AppColors.zigoGreyTextColor,
                                        //               // fontWeight: FontWeight.bold,
                                        //               fontSize: Dimensions.font16-2,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ), // ShOWN ended
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
                                              // Saving Budget to DataBase
                                              budgetController.saveBudgetInDataBase(_budgetNameController.text.trim());
                                              // Removing the prev. dialog and initiating a new one with pop(context)
                                              Navigator.pop(context);
                                              // showDialog(
                                              //   context: context, 
                                              //   builder: (context) {
                                              //     // Wrapping AlertDialog in Stateful Builder in order to activate setState()
                                              //     return StatefulBuilder(
                                              //       builder: (context, setState) {
                                              //         return AlertDialog(
                                              //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius30)),
                                              //           contentPadding: EdgeInsets.only(top: Dimensions.height10),   
                                              //           title:  Center(
                                              //             child: Text(
                                              //               'Save File',
                                              //               style: GoogleFonts.montserrat(                          
                                              //                 fontWeight: FontWeight.bold,
                                              //                 fontSize: Dimensions.font23,                             
                                              //               ),
                                              //             ),
                                              //           ),
                                              //           // dialog box CONTENT. One With File Location
                                              //           content: Container(
                                              //             color: AppColors.zigoBackgroundColor.withOpacity(0.1),
                                              //             width: double.infinity,
                                              //             height: Dimensions.height50*4,  
                                              //             child: Column(
                                              //               children: [
                                              //                 // Here's the container with FILE NAME text
                                              //                 Container(
                                              //                   margin: EdgeInsets.only(right: Dimensions.width50*3.7, top: Dimensions.height12),
                                              //                   child: Text(
                                              //                     'File Name:',
                                              //                     style: GoogleFonts.montserrat(
                                              //                       color: AppColors.zigoTextBlackColor,
                                              //                       fontWeight: FontWeight.w700,                             
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //                 SizedBox(height: Dimensions.height4),
                                              //                 // Container with FILE NAME & FILE TYPE eg docx, pdf. etc
                                              //                 Container(
                                              //                   height: Dimensions.height50,
                                              //                   width: Dimensions.width50*6,
                                              //                   color: AppColors.zigoBackgroundColor,
                                              //                   child: Row(
                                              //                     children: [
                                              //                       // The Vertical Divider 1
                                              //                       VerticalDivider(
                                              //                         color: AppColors.zigoGreyTextColor,
                                              //                         thickness: 2,
                                              //                         width: Dimensions.width20*2,
                                              //                         indent: Dimensions.height12,
                                              //                         endIndent: Dimensions.height12,
                                              //                       ),
                                              //                       // The Text Bearing FILE NAME
                                              //                       Container(                                                          
                                              //                         width: Dimensions.width50*3,
                                              //                         child: Text(
                                              //                           _budgetNameController.text, // getting budget name from textController
                                              //                           maxLines: 1,
                                              //                           overflow: TextOverflow.ellipsis,
                                              //                           style: GoogleFonts.montserrat(
                                              //                             color: AppColors.zigoGreyTextColor,
                                              //                             fontWeight: FontWeight.bold,
                                              //                             fontSize: Dimensions.font26/2,
                                              //                           ),
                                              //                         ),
                                              //                       ),
                                              //                       // The Vertical Divider 2
                                              //                       SizedBox(width: Dimensions.width4),
                                              //                       VerticalDivider(
                                              //                         color: AppColors.zigoGreyTextColor,
                                              //                         thickness: 2.2,
                                              //                         width: Dimensions.width20*1.5,
                                              //                         indent: Dimensions.height12,
                                              //                         endIndent: Dimensions.height12,
                                              //                       ),
                                              //                       // DropDown Button which shows LIST of FILE TYPES eg. docx. pdf...
                                              //                       Expanded(
                                              //                         child: Container(
                                              //                           width: Dimensions.width20,
                                              //                           padding: EdgeInsets.symmetric(horizontal: Dimensions.width4),
                                              //                           child: DropdownButtonHideUnderline(
                                              //                             child: DropdownButton(                            
                                              //                               isExpanded: false,
                                              //                               icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font20),  
                                              //                               value: currentFileType,
                                              //                               items: fileTypeList.map((e) {
                                              //                                 return DropdownMenuItem(value: e, child: Text(e));
                                              //                               }).toList(), 
                                              //                               onChanged: (String? newValue){
                                              //                                 setState(() {
                                              //                                   currentFileType = newValue!;
                                              //                                 });
                                              //                               },
                                              //                               style: GoogleFonts.montserrat(fontSize: Dimensions.font12, color: Colors.black),
                                              //                             ),
                                              //                           ),
                                              //                         ),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                 ),
                                              //                 SizedBox(height: Dimensions.height20),
                                              //                 // Here's the container with FILE LOCATION text
                                              //                 Container(
                                              //                   margin: EdgeInsets.only(right: Dimensions.width50*3.4),
                                              //                   child: Text(
                                              //                     'File Location:',
                                              //                     style: GoogleFonts.montserrat(
                                              //                       color: AppColors.zigoTextBlackColor,
                                              //                       fontWeight: FontWeight.w700,                             
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //                 SizedBox(height: Dimensions.height4),
                                              //                 // Container with FILE LOCATION eg LocalDisk/phone/doc/...
                                              //                 Container(
                                              //                   padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
                                              //                   height: Dimensions.height50,
                                              //                   width: Dimensions.width50*6,
                                              //                   color: AppColors.zigoBackgroundColor,
                                              //                   child: Center(
                                              //                     child: Text(
                                              //                       'LocalDisk/Public/Documents/ Obuducattle ranch',
                                              //                       maxLines: 1,
                                              //                       overflow: TextOverflow.ellipsis,
                                              //                       style: GoogleFonts.montserrat(
                                              //                         color: AppColors.zigoGreyTextColor,
                                              //                         fontWeight: FontWeight.bold,
                                              //                         fontSize: Dimensions.font26/2,
                                              //                       ),
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ), // end of dialog content
                                              //           // Action buttons
                                              //           actions: [
                                              //            Container(
                                              //             width: double.maxFinite,
                                              //             height: Dimensions.height50,
                                              //             padding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
                                              //             child: Row(
                                              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //               children: [
                                              //                  InkWell(
                                              //                   onTap: () => Navigator.pop(context),
                                              //                   child: Text(
                                              //                     'Cancel',
                                              //                     style: GoogleFonts.montserrat(
                                              //                       color: AppColors.zigoTextBlackColor,
                                              //                       fontWeight: FontWeight.w700,
                                              //                       fontSize: Dimensions.font20-2,                         
                                              //                     ),
                                              //                   ),
                                              //                 ),
                                              //                 // Vertical Divider
                                              //                 VerticalDivider(
                                              //                   color: AppColors.zigoGreyTextColor,
                                              //                   thickness: 4,
                                              //                   width: Dimensions.width20*2,
                                              //                   indent: Dimensions.height9,
                                              //                   endIndent: Dimensions.height4,
                                              //                 ),
                                              //                 // Save AppButton with another Dialog box. Pops up When clicked
                                              //                 InkWell(
                                              //                   child: Text(
                                              //                     'Save',
                                              //                     style: GoogleFonts.montserrat(
                                              //                       color: AppColors.zigoTextBlackColor,
                                              //                       fontWeight: FontWeight.w700,
                                              //                       fontSize: Dimensions.font20,                         
                                              //                     ),
                                              //                   ),
                                              //                   onTap: (){}
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //            ),
                                              //           ],
                                              //         );
                                              //       },
                                              //     );
                                              //   }
                                              // );                                  
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
          );
        }
      ),
      bottomNavigationBar:  const ZigoBottomNavBar(),
    );
  }
}