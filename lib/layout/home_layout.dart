import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo_list/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/done_tasks/done_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/new_tasks/new_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
   int currentIndex = 0;
   List<String> titles = 
   [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
   ];
   List<Widget> screens = 
   [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
   ];
   @override
  void initState() {
    super.initState();
    print('object');
    createDatabase();
  }
   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[currentIndex],
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () 
        {
          // GetName().then((value){
          //   print(value);
          //   print('mohamed');
          //   throw('errorrrr');  
          // }).catchError((error){
          //   print(error.toString());
          // });
        },
        child: Icon(
          Icons.add,
        ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: 
        [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks'
          ),        
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline_rounded,
            ),
            label: 'Done'
          ),        
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archive'
          ),
        
        ], 
        ),
    );
  }

  Future<String>  GetName () async
  {
    return 'mmmmiaia';
  } 

  void createDatabase () async 
  {
    var database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value){
          print('table created');
          }).catchError((error){
            print('error when creating table : ${error.toString()}');
          });
        
      },
      onOpen: (database) {
        print('database opened');
      },
    );
  }

}