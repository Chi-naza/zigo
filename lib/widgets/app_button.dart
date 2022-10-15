import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  AppButton({Key? key, required this.text, this.height, this.width, this.onTap}) : super(key: key);

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Container(
          child: ElevatedButton(
            onPressed: onTap, 
            child: !authController.isLoading.value? Text(text) : Padding(
              padding: EdgeInsets.all(Dimensions.radius20/4),
              child: CircularProgressIndicator(color: Colors.white.withOpacity(0.6)),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width?? Dimensions.width50*2, height?? Dimensions.height20*2),
            ),
          ),
        );
      }
    );
  }
}