import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/zigo_logo.dart';

class SignUpScreen extends StatefulWidget{
  
  const SignUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  AuthController authController = Get.find();

  final formKey = GlobalKey<FormState>(); 

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();  

  bool isTermsOfServiceAccepted = false;


  // For launching urls 
  Future<void> _launchPrivacyPolicyUrl() async {
    final Uri _url = Uri.parse('https://github.com/Chi-naza/zigo/blob/master/PRIVACY_POLICY.md');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  

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
                    decoration: const BoxDecoration(
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // for username/email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,                      
                      validator: (value){
                        if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {                            
                          return "Provide a valid email for a registration";
                        }else{
                          return null;
                        }
                      },                        
                      decoration: InputDecoration(
                        helperText: 'Email',
                        helperStyle: GoogleFonts.montserrat(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.font16+2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    // for password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8 ) {                            
                          return "Password should contain atleast 8 characters";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        helperText: 'Password',                        
                        helperStyle: GoogleFonts.montserrat(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.font16+2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    // TERMS of Service Section
                    Row(
                      children: [
                        // Checkbox
                        Checkbox(
                          value: isTermsOfServiceAccepted,
                          onChanged: (bool? value) {
                            setState(() {
                              isTermsOfServiceAccepted = value!;
                            });
                          },
                        ),
                        // Texts
                        Container(
                          width: Dimensions.width50*4,
                          child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'By continuing, you agree to our ', 
                              style: TextStyle(
                                fontSize: Dimensions.font12, 
                                color: Colors.black,
                                letterSpacing: 1,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms of Service', 
                                  style: TextStyle(
                                    fontSize: Dimensions.font12, 
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    // launch terms of service link here
                                    _launchPrivacyPolicyUrl();
                                    }
                                ),
                                TextSpan(
                                  text: ' and ', 
                                  style: TextStyle(
                                    fontSize: Dimensions.font12, 
                                    color: Colors.black
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Privacy Policy', 
                                      style: TextStyle(
                                        fontSize: Dimensions.font12, 
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        // launch privacy policy link here
                                        _launchPrivacyPolicyUrl();
                                      }
                                    )
                                  ]
                                )
                              ]
                            )
                          )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height10),
                    // Row Housing the SignUp Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // for forgot password text
                        Text(
                          '',
                          style: GoogleFonts.montserrat(
                            color: AppColors.mainColor,
                            fontSize: Dimensions.font16,
                          ),
                        ),
                        // sign in button (from our custom button)
                        AppButton(
                          text: 'Sign up', 
                          backgroundColor: isTermsOfServiceAccepted? AppColors.mainColor : AppColors.mainColor.withOpacity(0.4),
                          onTap: !isTermsOfServiceAccepted? (){} : (){
                            //only proceeds if form data are valid
                            if(formKey.currentState!.validate()){                                                         
                              // calling the register function from AuthController
                              authController.register(_emailController.text.trim(), _passwordController.text.trim());
                            }                           
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Create account section
            SizedBox(height: Dimensions.height30),
            Column(
              children: [
                Text(
                  'Already have an Account?',
                  style: GoogleFonts.montserrat(
                    color: AppColors.zigoGreyTextColor,
                    fontSize: Dimensions.font12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: (){
                    authController.navigateToLoginScreen();
                  },
                  child: Text(
                  'Sign In',
                    style: GoogleFonts.montserrat(
                      color: AppColors.mainColor.withOpacity(0.7),
                      fontSize: Dimensions.font16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
           SizedBox(height: Dimensions.height30),
          ],
        ),
      ),
    );
  }
}