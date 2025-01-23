import 'package:flutter/material.dart';

class HomeSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
          textAlign: TextAlign.end,
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('noooo');
              },
              icon: Icon(Icons.notification_important)),
          IconButton.outlined(
              onPressed: () {
                print('stubd');
              },
              icon: Icon(Icons.wrong_location)),
          IconButton(
            icon: Text('hello'),
            onPressed: () {
              print('hello');
            },
          ),
        ],
        backgroundColor: Color.fromARGB(246, 1, 255, 34),
      ),
      body: Column(
        children:
 [
         Padding(
           padding: const EdgeInsets.all(50),
           child: Container(
             clipBehavior: Clip.antiAliasWithSaveLayer,
             decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  20
                ),
              ),
             ) ,
             child: Stack(
               alignment: Alignment.bottomCenter ,
               children: [
                 Image(
                  image: NetworkImage(
                    'https://cdn2.unrealengine.com/fortnite-battle-royale-chapter-2-remix-social-1920x1080-d13648f5d4e3.jpg',
                  ),
                   width: 200,
                   height: 200,
                   fit: BoxFit.cover,
                 ),
                 Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10 ,
                  ),
                   width: 200,
                   color: Color.fromARGB(255, 0, 0, 0).withOpacity(.6),
                   child: Text(
                    'fortnite',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 2, 2),
                      
                    ),
                   ),
                 ),
               ],
             ),
           ),
         ),  
         ],
      ), 
     );
  }
}
