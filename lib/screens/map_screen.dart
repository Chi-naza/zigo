import 'dart:async';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/widgets/animations/map_loading.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const String routeName = '/map-screen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  // completer: dart async functionalities.
  Completer<GoogleMapController> _controller = Completer();

  //Toggling UI as we need;
  bool searchToggle = false;

  // Text controllers
  final searchController = TextEditingController();

  // Map Position
  LatLng? _currentPosition;



  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  // Function which gets current location using Geolocator plugin
  Future<void> getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
       _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // if the current position is null, show map loading animation
      body: (_currentPosition !=null)? SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Dimensions.screenHeight,
                  width: Dimensions.screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(target: _currentPosition!, zoom: 15),
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    },
                  ),
                ),
                // Search Input field: Show textField if searchToggle (a boolean) is true
                searchToggle?
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height45),
                  child: Column(
                    children: [
                      Container(
                        height: Dimensions.height50,                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.radius15/3),                    
                        ),
                        child: TextFormField(
                          controller: searchController,                          
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.width20),
                            border: InputBorder.none,
                            hintText: 'Search',
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  searchToggle = false;
                                  searchController.text = '';
                                });
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) : Container(), // empty container when condition is false
              ],
            ),
          ],
        ),
      ) : const MapLoadingAnimation(),
      // fabCircular menu: utillized in our floating action button
      floatingActionButton: (_currentPosition ==null)? null : FabCircularMenu(
        alignment: Alignment.bottomLeft,
        fabColor: Colors.blue.shade50,
        fabOpenColor: Colors.red.shade100,
        ringDiameter: Dimensions.height50*5,
        ringWidth: Dimensions.width30*2,
        ringColor: Colors.blue.shade50,
        fabSize: Dimensions.width30*2,
        children: [
          IconButton(
            onPressed: (){
              setState(() {
                searchToggle = false;
              });
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.navigation),
          ),
        ],
      ),
    );
  }
}