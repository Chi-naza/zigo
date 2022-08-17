import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';


class ShowPopUpDialogButton extends StatelessWidget {
  
  final String buttonText;
  final String dialogTitleText;
  final Widget content;
  
  const ShowPopUpDialogButton({Key? key, required this.buttonText, required this.dialogTitleText, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: buttonText, 
      onTap: (){
        showDialog(
          context: context, 
          builder: (context) {
            // Using custom statefulBuilder in order to allow setState to work for alertDialog
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  // buttonPadding: EdgeInsets.zero,
                  // contentPadding: EdgeInsets.zero,
                  // title of dialog box                        
                  title: Center(
                    child: Text(
                      dialogTitleText,
                      style: GoogleFonts.montserrat(                          
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font23,                             
                      ),
                    ),
                  ),
                  // dialog box CONTENT
                  content: content,
                  actions: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                          color: AppColors.zigoTextBlackColor,
                          fontWeight: FontWeight.w700,                             
                        ),
                      ),
                    ),
                    AppButton(text: "Save", onTap: (){
                      Navigator.pop(context);
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hello Alert"),
                            content: Text("I am your body"),
                          );
                        }
                      );
                      
                    },
                    )
                  ],
                );
              },
            );
          }
        );
      },
    );
  }
}