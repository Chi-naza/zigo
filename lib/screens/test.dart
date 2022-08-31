import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';



class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<int> _selectedItems = [];
  int price = 30;
  int sum = 0;
  String selectedSeatsText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PLANE SYMBOL & PICK SEAT inside
                Container(
                  height: Dimensions.height50*10,
                  width: Dimensions.width50*4,
                  decoration: BoxDecoration(
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
                        children: List.generate(seats.length, (index) {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if(_selectedItems.contains(index)==false){
                                    sum = sum + price;
                                    _selectedItems.add(index);
                                    selectedSeatsText = "";
                                    _selectedItems.forEach((element) {
                                      if (selectedSeatsText != "") selectedSeatsText += " , ";
                                      selectedSeatsText += (seats[element]);

                                    });
                                  }else{
                                    sum = sum - price;
                                    _selectedItems.remove(index);
                                    selectedSeatsText = "";
                                    _selectedItems.forEach((element) {
                                      if (selectedSeatsText != "") selectedSeatsText += " , ";
                                      selectedSeatsText += (seats[element]);

                                    });
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: _selectedItems.contains(index) ? Colors.pink : Color(0xff828EFB), // background
                                onPrimary: Colors.white, // foreground
                              ),
                              child: Text(
                                seats[index],
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
                          fontSize: Dimensions.font26,                         
                        ),
                      ),
                      // Name & No. of PLANE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'BOEING',
                            style: GoogleFonts.poppins(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.font26,                         
                            ),
                          ),
                          Text(
                            '737',
                            style: GoogleFonts.poppins(
                              color: AppColors.zigoGreyTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.font26,                         
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
                              fontSize: Dimensions.font26,  
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
            )
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