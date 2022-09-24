import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';

class InputFieldWithDescriptionNLogo extends StatelessWidget {
  final String descriptionText;
  final IconData? icon;
  final String? hintText;
  final double? width;
  final TextEditingController controller;
  
  const InputFieldWithDescriptionNLogo({Key? key, required this.descriptionText, this.icon, this.hintText, this.width, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Icon(
          icon??Icons.airplanemode_on,
          size: Dimensions.font20-2,
        ),
        SizedBox(width: Dimensions.width4),
        // COLUMN: textfield & Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description TEXT
            Text(
              descriptionText,
              style: GoogleFonts.poppins(
                color: AppColors.zigoGreyTextColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font26/2,
              ),
            ),
            SizedBox(height: Dimensions.height4),
            Container(
              height: Dimensions.height20*2,
              width: width??Dimensions.width50*3,
              decoration: BoxDecoration(
                color: AppColors.zigoBackgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20/4),
              ),            
              child: Row(
                children: [
                  SizedBox(width: Dimensions.width10),
                  // the input field
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      expands: true,
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {                            
                          return "Input needed";
                        }else{
                          return null;
                        }
                      },                                                                               
                      decoration: InputDecoration(
                        hintText: hintText??'',
                        hintStyle: GoogleFonts.poppins(fontSize: Dimensions.font12, color: AppColors.zigoGreyTextColor, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                      ),
                    ),
                  ),               
                ],
              ),
            ),
          ],
        ), 
      ],
    );      
  }
}