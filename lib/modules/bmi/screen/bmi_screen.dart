import 'dart:math';

import 'package:flutter/material.dart';
import '../result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {


 @override
  void initState() {
  
    super.initState();
  }

  bool isMale = true;
  double Height = 120;
  int Weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 9, 181),
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: 
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: 
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.blueGrey[300],
                          borderRadius: BorderRadius.circular(
                            20
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                          [
                            Icon(
                              Icons.male,
                              size: 70,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),            
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isMale ? Colors.blue : Colors.blueGrey[300],
                          borderRadius: BorderRadius.circular(
                            20
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                          [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: 
                      [
                        Text(
                          '${Height.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: Height ,
                      min: 80,
                      max: 220, 
                      onChanged: (value){
                        setState(() {
                          Height = value;
                        });
                      }
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: 
                [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(
                              20
                            ),
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        [
                          Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                          Text(
                                '$Weight',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50,
                                ),
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                            [
                              FloatingActionButton(
                                heroTag: 'Weight-',
                                mini: true ,
                                onPressed:(){
                                  setState(() {
                                    Weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ) , 
                                ),
                              FloatingActionButton(
                                mini: true ,
                                onPressed:(){
                                  Weight++;
                                  setState(() {
                                    
                                  });
                                },
                                heroTag: 'Weight+',
                                child: Icon(
                                  Icons.add,
                                ) , 
                                ),
                            ],
                          ),                         
                        ],
                      ),
                    ),
                  ),         
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(
                              20
                            ),
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        [
                          Text(
                                      'Age',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                          Text(
                                '$age',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50,
                                ),
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                            [
                              FloatingActionButton(
                                heroTag: 'Age-',
                                mini: true ,
                                onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ) , 
                                ),
                              FloatingActionButton(
                                heroTag: 'Age+',
                                mini: true ,
                                onPressed:(){
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ) , 
                                ),
                            ],
                          ),  
                        
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.green,
            child: MaterialButton(
              height: 50,
              onPressed: (){
                double result = Weight / pow(Height / 100, 2);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return BmiResultScreen(
                        age: this.age,
                        height: this.Height,
                        weight: this.Weight,
                        gender: '${this.isMale ? 'male' : 'female'}',
                        result: result,
                      );
                    }, 
                    ),
                  );
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                
                ),
              ),
              ),
          ),
        ],
      ),
    );
  }
}