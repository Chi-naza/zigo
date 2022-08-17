import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/zigo_logo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // stack for the top image and Zigo logo
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: Dimensions.height50*8,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/signIn.png'),
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height50*4),
                    child: ZigoLogo(zFontSize: Dimensions.height20*5.5, textFontSize: Dimensions.height20*2)
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height50),
            // Input fields section
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              child: Column(
                children: [
                  // for username
                  TextField(
                    decoration: InputDecoration(
                      helperText: 'Username',
                      helperStyle: GoogleFonts.montserrat(
                        color: AppColors.mainColor,
                        fontSize: Dimensions.font20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  // for password
                  TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      helperText: 'Password',
                      helperStyle: GoogleFonts.montserrat(
                        color: AppColors.mainColor,
                        fontSize: Dimensions.font20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                   // forget passsword section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // for forgot password text
                      InkWell(
                        onTap: (){},
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.montserrat(
                            color: AppColors.mainColor,
                            fontSize: Dimensions.font16,
                          ),
                        ),
                      ),
                      // sign in button (from our custom button)
                      AppButton(text: 'Sign in', onTap: (){},),
                    ],
                  ),
                ],
              ),
            ),
            // Create account section
            SizedBox(height: Dimensions.height50*2),
            InkWell(
              child: Text(
              'Create Account',
                style: GoogleFonts.montserrat(
                  color: AppColors.mainColor,
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.bold,
                ),
              ),
           ),
           SizedBox(height: Dimensions.height20),
          ],
        ),
      ),
    );
  }
}