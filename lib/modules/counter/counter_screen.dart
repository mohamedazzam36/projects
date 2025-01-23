import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
   int counter = 1 ;

@override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            TextButton(
              onPressed: ()
              {
                setState(() {
                  
                });
                counter--;
                print(counter);
              }, 
              child: Icon(
                Icons.exposure_minus_1,
                size: 30,
              ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20
              ),
              child: Text(
                '$counter',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TextButton(
              onPressed: ()
              {
                setState(() {
                  
                });
                counter++;
                print(counter);
              } , 
              child: Icon(
                Icons.plus_one,
                size: 30,
              ),
              ),
          ],
        ),
      ),
    );
  }
}