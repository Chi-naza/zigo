import 'package:flutter/material.dart';




class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {


List<String> stringData = ["Abuchi", "Somtoo", "Abakpa", "Adolf", "Pinacle", "Ebube", "Elizabeth"];
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    print("($w,  $h)");
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: h/h*0.6,
          children: List.generate(stringData.length, (index) => Container(
            // width: w*0.25,
            // height: h*0.49,
            decoration: BoxDecoration(
              color: Color.fromRGBO(236,97,10,1.0),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(stringData[index]),
          )),
        ),
      ),
    );
  }



}
   
      
      
      
      
      

