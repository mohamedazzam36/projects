import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 20,
      title: Row(
        children: 
        [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/ogw/AF2bZyjGrxFDeGFVQM3MBgG3zvhaZ38MnoHraySUe6bMoyfIlX8=s32-c-mo'),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: 
      [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  5
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: 
                  [
                    Icon(
                      Icons.search
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index) => Story(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemCount: 5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) => Chat(),
              itemCount: 10,
            ),
          ],
        ),
      ),
    ),
  );
  }
  


   Widget Story () =>  Container(
                  width: 60 ,
                  child: Column(
                    children: 
                    [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/ogw/AF2bZyjGrxFDeGFVQM3MBgG3zvhaZ38MnoHraySUe6bMoyfIlX8=s32-c-mo'),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: 3,
                              end: 3,
                            ),
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mohamed Azzam ',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                );     
  Widget Chat () => Row(
                    children: 
                    [
                      Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage('https://lh3.googleusercontent.com/ogw/AF2bZyjGrxFDeGFVQM3MBgG3zvhaZ38MnoHraySUe6bMoyfIlX8=s32-c-mo'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom: 3,
                                      end: 3,
                                    ),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: 
                          [
                            Text(
                              'Mohamed Azzam ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: 
                              [
                                Expanded(
                                  child: Text(
                                    'Hello My Name Is Mohamed',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 10
                                  ),
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '2.00 PM'
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),         
                    ],
                  );                         
  
}