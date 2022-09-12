import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // for drawer background color
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
        child: Column(
          children: const [
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              title: Text(
                'Ugwuoke Chinaza',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                "You wouldn't get it until you register",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}