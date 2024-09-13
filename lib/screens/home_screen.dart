import 'package:flutter_application_15/widgets/background_shape_left.dart';
import 'package:flutter_application_15/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String reslutText = '';
  double wightgood = 100;
  double wightbad = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تو چنده ؟ BMI',
          style: TextStyle(
            color: const Color.fromARGB(255, 236, 151, 151),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 125, 119, 119),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 100, 59, 6)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 72, 42, 3).withOpacity(0.5)),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 138, 173)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 50, 9, 182).withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                 var re = 25*(height*height);
                    var ezaf= weight-re;
                     if(
                      resultBMI>=30 && resultBMI<34.9){
                        wightbad=290;
                        wightgood=40;
                        reslutText='چاقی درجه یک';
                      }
                    else if(resultBMI>=35 && resultBMI<39.9){
                      wightbad=310;
                      wightgood=30;
                      reslutText='چاقی درجه دو';
                    
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                     wightbad = 50;
                    wightgood =270;
                    reslutText = 'وزن شما نرمال است';
                  } else {
                     wightbad = 10;
                    wightgood = 10;
                    reslutText = 'وزن شما کم‌تر از حد نرمال است';
                  }
                });
              },
              child: Text(
                '! محاسبه کن',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
            ),
            Text(
              '$reslutText',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 249, 91, 239)),
            ),
            SizedBox(
              height: 80,
            ),
            RightShape(
              widht: wightbad,
            ),
            SizedBox(
              height: 15,
            ),
            LeftShape(
              width: wightgood,
            )
          ],
        ),
      ),
    );
  }
}