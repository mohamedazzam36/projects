import 'package:flutter/material.dart';
import '../../models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> users = 
  [
    UserModel(
    id: 1 , 
    name: 'Mohamed', 
    phone: '+201096841014',
    ), 
    UserModel(
    id: 2 , 
    name: 'Ahmed', 
    phone: '+201030560227',
    ),    
    UserModel(
    id: 3 , 
    name: 'Amr', 
    phone: '+201067514343',
    ),    
    UserModel(
    id: 1 , 
    name: 'Mohamed', 
    phone: '+201096841014',
    ), 
    UserModel(
    id: 2 , 
    name: 'Ahmed', 
    phone: '+201030560227',
    ),    
    UserModel(
    id: 3 , 
    name: 'Amr', 
    phone: '+201067514343',
    ), 
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title: Text(
          'Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body:ListView.separated(
        itemBuilder: (context,index) => buildUserItem(users[index]), 
        separatorBuilder: (context,index) => Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 10,
          ),
          child: Container(
            height: 1,
            color: Colors.grey[300],
          ),
        ), 
        itemCount: users.length,
        )
    );
  }
 Widget buildUserItem(UserModel user) =>  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(

          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Text(
                  '${user.id}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 7
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    Text(
                      '${user.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Text(
                      '${user.phone}',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      

}