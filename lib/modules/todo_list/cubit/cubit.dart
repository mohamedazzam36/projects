import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo_list/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/states.dart';
import 'package:flutter_application_1/modules/todo_list/done_tasks/done_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/new_tasks/new_tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

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

   void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
   }
 
   late Database database; 
   bool isLoading = false;
   List<Map> newTasks = [];
   List<Map> doneTasks = [];
   List<Map> archivedTasks = [];


  void createDatabase (){
      openDatabase(
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
        isLoading = true;
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatebaseState());
    });
  }

   insertToDatabase(
    {
      required String title,
      required String time,
      required String date,
    }) async
  {
   await database.transaction ((txn)
    {
      return  txn.rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")'
        ).then((value)
        {
          print('$value inserted successfully');
          emit(AppInsertDatebaseState());
          getDataFromDatabase(database);        
          }).catchError((error)
        {
          print('error when inserting new record : ${error.toString()}');
        });
    
    });
    
  }

  void getDataFromDatabase(database)  
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatebaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value)
        {
          isLoading = false;

          value.forEach((element){
            if(element['status'] == 'new')
            newTasks.add(element);
            else if(element['status'] == 'done')
            doneTasks.add(element);
            else archivedTasks.add(element);
          });
          emit(AppGetDatebaseState());
        });
  }

bool isBottomSheetShown = false;
IconData fabIcon = Icons.edit;

void updateData({
  required String status,
  required int id,
}) async 
{
  database.rawUpdate(
    'UPDATE tasks SET status = ? WHERE id = ?',
    [status, id],
    ).then((value){
      getDataFromDatabase(database);
      emit(AppUpdateDatebaseState());
    });    
  
}

void deleteData({
  required int id,
}) async 
{
  database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
  .then((value){
      getDataFromDatabase(database);
      emit(AppDeleteDatebaseState());
    });    
  
}



void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
}){
  isBottomSheetShown = isShow;
  fabIcon = icon;

  emit(AppChangeBottomSheetState());
}
}