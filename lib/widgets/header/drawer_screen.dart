import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/screens/auth/update_profile_screen.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  AuthController authController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    var user = authController.currentUserData;
    return Theme(
      // for drawer background color
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  foregroundImage: NetworkImage(user.profileImage!),
                ),
              ),
              title: Text(
                user != null? '${user.firstName} ${user.lastName}' : 'Ugwuoke Chinaza',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                user != null? "${user.email}" : "You wouldn't get it until you register",
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ),
            // Testing Buttons
            SizedBox(height: Dimensions.height20*2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.1),
              child: ElevatedButton(
                onPressed: () => Get.to(() => UpdateProfileScreen()), 
                child: Text("Update Your Account"),
              ),
            ),            
            SizedBox(height: Dimensions.height50*7),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth*0.2),
              child: ElevatedButton.icon(
                onPressed: () => authController.signOut(), 
                label: Text("Log Out"),
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}