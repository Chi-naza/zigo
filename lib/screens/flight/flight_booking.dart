import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/flight_controller.dart';
import 'package:zigo/controllers/hotel_controller.dart';
import 'package:zigo/models/user_model.dart';
import 'package:zigo/widgets/custom_snackbar.dart';
import 'package:zigo/widgets/header/header_section.dart';
import 'package:zigo/widgets/inputfield_with_description_n_logo.dart';
import 'package:zigo/widgets/title_n_detail_texts.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/flight-booking';

  // List pp =  [{'seat': 'A1', 'picked': false}];

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {

  // PICKING SEAT. This List contains index of each of the seats picked
  // List<int> _selectedItems = []; 

  double totalAmount = 0;
  String selectedSeatsText = "";

  // DropDowns
  var startAirportList = ["Murtala Mohammed", "Airport 2", "Airport 3"];
  String startAirport = "Murtala Mohammed";

  var endAirportList = ["Murtala Mohammed", "Airport 2", "Airport 3"];
  String endAirport = "Murtala Mohammed";

  var flightTypeList = ["One Way", "Two-way", "Other way"];
  String currFlightType = "One Way";

  //Instance of Flight Controller
  FlightController _flightController = Get.find();


  // Text Controllers for TextFields and Inputs
  TextEditingController cityOfDepartureTextController = TextEditingController();
  TextEditingController cityOfArrivalTextController = TextEditingController();
  TextEditingController seatClassController = TextEditingController();
  TextEditingController noOfPersonsController = TextEditingController();
  TextEditingController luggageController = TextEditingController();


  // Form Key
  var _formKey = GlobalKey<FormState>();


  // Text Controller For: Date Picker - Departure/Arrival Date
  TextEditingController _departureDateController = TextEditingController();
  DateTime departureDate = DateTime.now();

  TextEditingController _dateOfReturnController = TextEditingController();
  DateTime dateOfReturn = DateTime.now();


  // show Date picker:  function - for departureDate
  _selectDepartureDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: departureDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100)
      );

    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _departureDateController.text = date;
      });
    }
  }

  // show Date picker:  function - for dateOfReturn
  _selectDateOfReturn(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateOfReturn,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100)
      );

    if (picked != null && picked != dateOfReturn) {
      setState(() {
        dateOfReturn = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateOfReturnController.text = date;
      });
    }
  }



  // FOR Stepper
  int _activeStepIndex = 0;

  onStepContinueFunction() {
    // Continue Button on the first form of the Stepper
    if(_activeStepIndex == 0){
      _flightController.getMyDesiredPlane(
        dateOfDeparture: _departureDateController.text.trim(), 
        airport: startAirport, 
        cityOfDeparture: cityOfDepartureTextController.text.trim(),
      );
    }

    // Continue Button on the second step of the Stepper
    if(_activeStepIndex == 1){
      // calling the seat status calculator
      _flightController.showSeatStatus(_flightController.oneFlightModel);
    }

    // Continue Button on the last Step of the stepper
    if (_activeStepIndex < (stepList().length - 1)) {
      setState(() {
        _activeStepIndex += 1;
      });
    } else {

      // IF FIELDS ARE EMPTY OR SOME FIELDS ARE EMPTY 
      // Directing the user back to complete 'incomplete details'
      if(
        cityOfArrivalTextController.text.isEmpty || 
        cityOfDepartureTextController.text.isEmpty || 
        _dateOfReturnController.text.isEmpty ||
        _departureDateController.text.isEmpty ||
        seatClassController.text.isEmpty ||
        noOfPersonsController.text.isEmpty ||
        luggageController.text.isEmpty
      ){
        // custom snackbar to send the user back
        customSnackbar(
          titleText: "Incomplete Details",
          bodyText: "Please make sure that you have provided the necessary details",
          isError: true
        );
      }else{
        // Instantiating booked flight model
        BookedFlightModel bModel = BookedFlightModel(
          flight: _flightController.oneFlightModel.toJson(), //LATER: will come from the flight user picks
          cityOfArrival: cityOfArrivalTextController.text.trim(), 
          cityOfDeparture: cityOfDepartureTextController.text.trim(), 
          startAirport: startAirport, 
          endAirport: endAirport, 
          dateOfDeparture: _departureDateController.text.trim(), 
          dateOfReturn: _dateOfReturnController.text.trim(), 
          seatClass: seatClassController.text.trim(), 
          noOfPersons: noOfPersonsController.text.trim(), 
          luggage: luggageController.text.trim(), 
          amountDue: totalAmount.toString(), 
          seatsBooked: selectedSeatsText,
        );

        // Calling bookFlight function only when the form is valid
        if(_formKey.currentState!.validate()){
          _flightController.bookFlight(
            plane: _flightController.oneFlightModel, //TODO: will change later to choiceFlight
            bookedFlightModel: bModel
          );

          print('Submited');

        }
      }    
      
    }
  }


  onStepCancelFunction() {
    if (_activeStepIndex == 0) {
      return;
    }
    setState(() {
      _activeStepIndex -= 1;
    });
  }


  List<Step> stepList(){
    return [
      // STEP 1: Flight Form
      Step(
          state: _activeStepIndex == 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: Text(_activeStepIndex==0? 'Enter Details' : ''),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            height: Dimensions.height50*7,
            // color: Colors.amber,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ROW FOR: City of DEPARTURE & ARRIVAL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon/Departure
                      InputFieldWithDescriptionNLogo(
                        controller: cityOfDepartureTextController,
                        descriptionText: 'City of Departure', 
                        hintText: 'Lagos', 
                        icon: Icons.flight_takeoff, 
                        width: Dimensions.width50*2.75,
                      ),
                      // Icon/Arrival
                      InputFieldWithDescriptionNLogo(
                        controller: cityOfArrivalTextController,
                        descriptionText: 'City of Arrival', 
                        icon: Icons.flight_land,
                        width: Dimensions.width50*2.75,
                      ),                   
                    ],
                  ),
                  // ROW: CHOOSE AIRPORT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon/Choose Airport
                      Row(
                        children: [
                          // Icon now as Image in Container
                          Container(
                            height: Dimensions.height20,
                            width: Dimensions.width15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/aiportTower.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),      
                          SizedBox(width: Dimensions.width4),
                          // COLUMN: textfield & Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // choose Airport TEXT
                              Text(
                                'Choose Airport',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font26/2,
                                ),
                              ),
                              SizedBox(height: Dimensions.height4),
                              // DropdownList wrapped in a Container widget
                              Container(
                                height: Dimensions.height20*2,
                                width: Dimensions.width50*2.9,
                                decoration: BoxDecoration(
                                  color: AppColors.zigoBackgroundColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                ),  
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                                  // Wrapping dropdown button widget with this: to remove the persitent underline
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(                            
                                      isExpanded: true,
                                      icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                      value: startAirport,
                                      items: startAirportList.map((e) {
                                        return DropdownMenuItem(value: e, child: Text(e));
                                      }).toList(), 
                                      onChanged: (String? newValue){
                                        setState(() {
                                          startAirport = newValue!;
                                        });
                                      },
                                      style: GoogleFonts.poppins(fontSize: Dimensions.font12, color: AppColors.zigoGreyTextColor, fontWeight: FontWeight.bold, ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), 
                        ],
                      ),
                      // Icon/Destination Airport
                      Row(
                        children: [
                          // Icon now as Image in Container
                          Container(
                            height: Dimensions.height20,
                            width: Dimensions.width15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/aiportTower.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),      
                          SizedBox(width: Dimensions.width4),
                          // COLUMN: textfield & Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // choose Destination Airport TEXT
                              Text(
                                'Destination Airport',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font26/2,
                                ),
                              ),
                              SizedBox(height: Dimensions.height4),
                              // DropdownList wrapped in a Container widget
                              Container(
                                height: Dimensions.height20*2,
                                width: Dimensions.width50*2.9,
                                decoration: BoxDecoration(
                                  color: AppColors.zigoBackgroundColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                ),                              
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                                  // Wrapping dropdown button widget with this: to remove the persitent underline
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(                            
                                      isExpanded: true,
                                      icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                      value: endAirport,
                                      items: endAirportList.map((e) {
                                        return DropdownMenuItem(value: e, child: Text(e));
                                      }).toList(), 
                                      onChanged: (String? newValue){
                                        setState(() {
                                          endAirport = newValue!;
                                        });
                                      },
                                      style: GoogleFonts.poppins(fontSize: Dimensions.font12, color: AppColors.zigoGreyTextColor, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), 
                        ],
                      ),
                    ],
                  ),
                  //ROW: DEPARTURE & RETURN DATES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ROW FOR: Date of Departure
                      Row(
                        children: [
                          // Icon 
                          Icon(Icons.calendar_today, size: Dimensions.font20-2),               
                          SizedBox(width: Dimensions.width4),
                          // DATE & TEXT
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date of Departure',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font26/2,
                                ),
                              ),
                              SizedBox(height: Dimensions.height4),
                              // The text Field & DatePicker
                              GestureDetector(
                                onTap: () => _selectDepartureDate(context),
                                // AbsorbPointer widget to disable tap or on the textField
                                child: AbsorbPointer(
                                  child:  Container(
                                    height: Dimensions.height20*2,
                                    width: Dimensions.width50*1.8,
                                    decoration: BoxDecoration(
                                      color: AppColors.zigoBackgroundColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                    ),            
                                    child: Row(
                                      children: [
                                        SizedBox(width: Dimensions.width10),
                                        // the input field
                                        Expanded(
                                          child: TextField(
                                            controller: _departureDateController,
                                            expands: true,
                                            maxLines: null,                                                                               
                                            decoration: InputDecoration(
                                              hintText: '',
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // COLUMN: TYPE of FLIGHT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // choose Airport TEXT
                          Text(
                            'Type',
                            style: GoogleFonts.poppins(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font26/2,
                            ),
                          ),
                          SizedBox(height: Dimensions.height4),
                          // DropdownList wrapped in a Container widget
                          Container(
                            height: Dimensions.height20*2,
                            width: Dimensions.width50*1.6,                          
                            decoration: BoxDecoration(
                              color: AppColors.zigoBackgroundColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width12),
                              // Wrapping dropdown button widget with this: to remove the persitent underline
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(                            
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down, size: Dimensions.font26),  
                                  value: currFlightType,
                                  items: flightTypeList.map((e) {
                                    return DropdownMenuItem(value: e, child: Text(e));
                                  }).toList(), 
                                  onChanged: (String? newValue){
                                    setState(() {
                                      currFlightType = newValue!;
                                    });
                                  },
                                  style: GoogleFonts.poppins(fontSize: Dimensions.font12, color: AppColors.zigoGreyTextColor, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ), 
                      // ROW FOR: Date of RETURN & ICON
                      Row(
                        children: [
                          // Icon
                          Icon(Icons.calendar_today, size: Dimensions.font20-2), 
                          SizedBox(width: Dimensions.width4),
                          // DATE & TEXT
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date of Return',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font26/2,
                                ),
                              ),
                              SizedBox(height: Dimensions.height4),
                              // The text Field & DatePicker
                              GestureDetector(
                                onTap: () => _selectDateOfReturn(context),
                                // AbsorbPointer widget to disable tap or on the textField
                                child: AbsorbPointer(
                                  child:  Container(
                                    height: Dimensions.height20*2,
                                    width: Dimensions.width50*1.8,
                                    decoration: BoxDecoration(
                                      color: AppColors.zigoBackgroundColor,
                                      borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                    ),            
                                    child: Row(
                                      children: [
                                        SizedBox(width: Dimensions.width10),
                                        // the input field
                                        Expanded(
                                          child: TextField(
                                            controller: _dateOfReturnController,
                                            expands: true,
                                            maxLines: null,                                                                               
                                            decoration: InputDecoration(
                                              hintText: '',
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // ROW: SEAT, PERSONS, LUGGAGE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    //seat class
                    InputFieldWithDescriptionNLogo(
                      controller: seatClassController,
                      descriptionText: 'Seat Class', 
                      width: Dimensions.width50*1.8, 
                      icon: Icons.airline_seat_recline_normal
                    ),
                    //no. of persons
                    InputFieldWithDescriptionNLogo(
                      controller: noOfPersonsController,
                      descriptionText: 'No. of Person', 
                      width: Dimensions.width50*1.8, 
                      icon: Icons.group
                    ),
                    //luggage
                    InputFieldWithDescriptionNLogo(
                      controller: luggageController,
                      descriptionText: 'Luggage', 
                      width: Dimensions.width50*1.8, 
                      icon: Icons.luggage
                    ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      //STEP 2: List of AIRlines & Locations
      Step(
        state:  _activeStepIndex == 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: Text(_activeStepIndex==1? 'Choose Flight' : ''),
        content: Container(
          height: Dimensions.height50*8,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              return Container(
                height: Dimensions.height50*2.5,
                margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flight890new.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          ),
        ),
      ),
      //STEP 3: Choose Seat
      Step(
        state: _activeStepIndex == 2 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: Text(_activeStepIndex==2 ? 'Choose Seat' : ''),
        content: GetBuilder<FlightController>(builder: (controller) {
          return Container(
            height: Dimensions.height50*13,
            // padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // PLANE SYMBOL & PICK SEAT inside
                    Container(
                      height: Dimensions.height50*10,
                      width: Dimensions.width50*4,
                      decoration: const BoxDecoration(
                        // color: Colors.redAccent,
                        image: DecorationImage(
                          image: AssetImage('assets/images/plane_symbol.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Container(
                        transform: Matrix4.translationValues(0, Dimensions.height30*2, 1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                          child: GridView.count(
                            crossAxisSpacing: 20,
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            // Getting the list of seats from the choiceFlight. Wwe are using OneFlightModel as a test
                            children: List.generate(_flightController.oneFlightModel.seats.length, (index) {
                              var planeSeats = _flightController.oneFlightModel.seats[index]['seat'];
                              var isPlanePicked = _flightController.oneFlightModel.seats[index]['picked'];
                              var _selectedItems = _flightController.selectedFlightSeatsIndexList;
                              return Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if(isPlanePicked == false){
                                        if(_selectedItems.contains(index)==false){
                                          totalAmount +=  double.parse(_flightController.oneFlightModel.price);                                          
                                          _selectedItems.add(index);
                                          print("Total Amount for Flight: $totalAmount"); //test
                                          print("Selected Seat Index List: $_selectedItems"); //test                                          
                                          selectedSeatsText = "";
                                          _selectedItems.forEach((element) {
                                            if (selectedSeatsText != "") selectedSeatsText += " , ";
                                            selectedSeatsText += (seats[element]);
                                          });
                                        }else{
                                          totalAmount -=  double.parse(_flightController.oneFlightModel.price);                                         
                                          _selectedItems.remove(index);
                                         _flightController.selectedFlightSeatsIndexList.refresh(); // update with new changes list on the fly
                                           print("Total Amount for Flight: $totalAmount"); //test
                                          print("Selected Seat Index List: $_selectedItems"); //test
                                          selectedSeatsText = "";
                                          _selectedItems.forEach((element) {
                                            if (selectedSeatsText != "") selectedSeatsText += " , ";
                                            selectedSeatsText += (seats[element]);
                                          });
                                        }                                        
                                      }
                                    });
                                    // calling our seatStatus function: which executes at every tap or press
                                    _flightController.showSeatStatus(_flightController.oneFlightModel); 
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: isPlanePicked ? Colors.pink : (_selectedItems.contains(index)? Colors.green :Color(0xff828EFB)), // background
                                    onPrimary: Colors.white, // foreground
                                    // primary: _selectedItems.contains(index) ? Colors.pink : Color(0xff828EFB), // background
                                    // onPrimary: Colors.white, // foreground
                                  ),
                                  child: Text(
                                    planeSeats,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    // CONTAINER: The Texts by the Right
                    Container(
                      height: Dimensions.height50*7,
                      // width: Dimensions.width50*4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'CHOOSE SEAT',
                            style: GoogleFonts.poppins(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.font23,                         
                            ),
                          ),
                          // Name & No. of PLANE
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                controller.flightDataList[0].flightName.toUpperCase(), // name of plane
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: Dimensions.font20+2,                         
                                ),
                              ),
                              Text(
                                controller.flightDataList[0].flightID, // plane ID
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: Dimensions.font20,                         
                                ),
                              ),
                            ],
                          ),
                          // SEAT NO. & Input FIELD
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // seat no.
                              Text(
                                'SEAT NO.',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: Dimensions.font23,  
                                  wordSpacing: 2,                       
                                ),
                              ),
                              // input field
                              Container(
                                height: Dimensions.height50,
                                width: Dimensions.width50*2,
                                color: AppColors.zigoBackgroundColor2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: selectedSeatsText, // picked from the selected seat
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.zigoBackgroundColor2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // LEGEND section
                Obx(() {
                    return Container(
                      margin: EdgeInsets.only(left: Dimensions.width30, top: Dimensions.height30),
                      child: Column(
                        children: [
                          // chosen seats
                          Row(
                            children: [
                              Container(
                                height: Dimensions.height18,
                                width: Dimensions.width18,
                                color: Colors.green,
                              ),
                              SizedBox(width: Dimensions.width16),
                              Text(
                                '${_flightController.chosenSeats} Picked Seats',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font26/2,                         
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height10),
                          // seats available
                          Row(
                            children: [
                              Container(
                                height: Dimensions.height18,
                                width: Dimensions.width18,
                                color: Color(0xff828EFB),
                              ),
                              SizedBox(width: Dimensions.width16),
                              Text(
                                '${_flightController.availableSeats} Seats Available',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font26/2,                         
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height10),
                          // seats Unavailable
                          Row(
                            children: [
                              Container(
                                height: Dimensions.height18,
                                width: Dimensions.width18,
                                color: Colors.pink,
                              ),
                              SizedBox(width: Dimensions.width16),
                              Text(
                                '${_flightController.unAvailableSeats} Seats Unavailable',
                                style: GoogleFonts.poppins(
                                  color: AppColors.zigoGreyTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font26/2,                         
                                ),
                              ),
                            ],
                          ),                 
                        ],
                      ),
                    );
                  }
                ),
              ],
            ),
          );
        }),
      ),
      //STEP 4: See Info & Save
      Step(
        state: _activeStepIndex == 3 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 3,
        title: Text(_activeStepIndex==3? 'Save' : ''),
        content: Container(
          height: Dimensions.height50*4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // city of departure
                  TitleAndDetailTexts(title: 'City of Departure', detailText: cityOfDepartureTextController.text.trim()), // city of Departure
                  // city of Arrival
                  TitleAndDetailTexts(title: 'City of Arrival', detailText: cityOfArrivalTextController.text.trim()), // city of Arrival
                  // choose Airport
                  TitleAndDetailTexts(title: 'Choose Airport', detailText: startAirport), // start Airport
                ],
              ),
              // row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // city of departure
                  TitleAndDetailTexts(title: 'Destination Airport', detailText: endAirport), // endAirport
                  // city of Arrival
                  TitleAndDetailTexts(title: 'Date of Departure', detailText: _departureDateController.text.trim()), // date of Departure
                  // choose Airport
                  TitleAndDetailTexts(title: 'Date of Return', detailText: _dateOfReturnController.text.trim()), // date of Return
                ],
              ),
              // row 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // city of departure
                  TitleAndDetailTexts(title: 'Type', detailText: seatClassController.text.trim()), // seat Class or type of flight
                  // city of Arrival
                  TitleAndDetailTexts(title: 'No. of Persons', detailText: noOfPersonsController.text.trim()), // no. of persons
                  // choose Airport
                  TitleAndDetailTexts(title: 'Luggage', detailText: luggageController.text.trim()), //luggage
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header section
            HeaderSection(headerText: 'FLIGHT BOOKING'),
            // STEPPER SECTION            
            Theme(
              data: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(primary: Color(0xff828EFB)),
              ),
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight,
                child: Stepper(
                  physics: const ClampingScrollPhysics(),
                  type: StepperType.horizontal,
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepCancel: onStepCancelFunction,
                  onStepContinue: onStepContinueFunction,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



List<String> seats = [
  'A1',
  'A2',
  'A3',
  'A4',
  'A5',
  'B1',
  'B2',
  'B3',
  'B4',
  'B5',
  'C1',
  'C2',
  'C3',
  'C4',
  'D1',
  'D2',
  'D3',
  'D4',
  'D5',
  'E1',
  'E2',
  'E3',
  'E4',
  'E5',
];




