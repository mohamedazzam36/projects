import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {

  final gender;
  final height;
  final age;
  final weight;
  final result;

  BmiResultScreen({
   @required this.gender,
    @required this.height,
    @required this.age,
    @required this.weight,
    @required this.result,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 35
            ),
            child: Text(
              'Result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            Text(
              'Gender : $gender ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'Height : ${height.round()} ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'Age : $age ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'Weight : $weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
               color: Colors.amber,
               border: Border.all(
                color: Colors.black,
                width: 5,
               ),
              ),
              child: Text(
                'Result : ${(result*10).round()/10}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Image(
              image: AssetImage('assets/images/flower.jpg'),
              height: 150,
              width: 200,
              ),
             
          ],
        ),
      ),
    );
  }
}