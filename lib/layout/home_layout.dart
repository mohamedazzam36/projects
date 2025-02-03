import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo_list/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/cubit.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/states.dart';
import 'package:flutter_application_1/modules/todo_list/done_tasks/done_tasks_screen.dart';
import 'package:flutter_application_1/modules/todo_list/new_tasks/new_tasks_screen.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constatnts.dart';

class HomeLayout extends StatelessWidget {

   var ScaffoldKey = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();
   var titleController = TextEditingController();
   var timeController = TextEditingController();
   var dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){
          if(state is AppInsertDatebaseState){
            Navigator.pop(context);
            titleController.clear();
            timeController.clear();
            dateController.clear(); 
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
          key: ScaffoldKey ,
          body: cubit.isLoading ? Center(child: CircularProgressIndicator()) : cubit.screens[cubit.currentIndex],
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(cubit.isBottomSheetShown){
                if (formKey.currentState?.validate() ?? false){
        cubit.insertToDatabase(
          title: titleController.text , 
          time: timeController.text, 
          date: dateController.text,
          );
        //         insertToDatabase(
        //           time: timeController.text,
        //           date: dateController.text,
        //           title: titleController.text,
        //         ).then((Value){
        //            getDataFromDatabase(database).then((value){
        // Navigator.pop(context);
        // isBottomSheetShown = false;
        // titleController.clear();
        // timeController.clear();
        // dateController.clear(); 
        // setState(() {
        //   tasks = value;
        //   isLoading = false;
        //   fabIcon = Icons.edit;       
        // });
        // });
        // });
              }
              } else 
              {
                ScaffoldKey.currentState?.showBottomSheet(
                elevation: 50,
              (context){
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: 
                      [
                        defaultFormField(
                          controller: titleController, 
                          keyboard: TextInputType.text, 
                          labelText: 'Task Title', 
                          prefixIcon: Icons.title,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Title must not be empty';
                            }
                            return null;
                            
                          },
                          ),             
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          readOnly: true,
                          controller: dateController, 
                          keyboard: TextInputType.datetime, 
                          labelText: 'Task Date', 
                          prefixIcon: Icons.calendar_month_rounded,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Date must not be empty';
                            }
                            return null;
                          },
                          onTap: () {
                           showDatePicker(
                            context: context, 
                            firstDate: DateTime.now(), 
                            lastDate: DateTime.parse('2025-05-04'),
                            ).then((value)
                            {
                              if(value != null)
                              {
                              dateController.text = DateFormat.yMMMd().format(value);
                              }
                            });
                          },
                          ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          readOnly: true,
                          controller: timeController, 
                          keyboard: TextInputType.datetime, 
                          labelText: 'Task Time', 
                          prefixIcon: Icons.watch_later_rounded,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return 'Time must not be empty';
                            }
                            return null;
                          },
                          onTap: () {
                            showTimePicker(
                            context: context, 
                            initialTime: TimeOfDay.now()
                            ).then((value){
                              timeController.text = value?.format(context).toString() ?? "";
                            });
                          },
                          ),
                      
                      ],
                    ),
                  ),
                );
              },
             ).closed.then((value)
             {
              cubit.changeBottomSheetState(
                isShow: false, 
                icon: Icons.edit
                );
             });
             
              cubit.changeBottomSheetState(
                isShow: true , 
                icon: Icons.add
                );    

              }
            },
            child: Icon(
              cubit.fabIcon,
            ),
            ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              AppCubit.get(context).changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
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
        },
              ),
    );
  }



// void deleteAllTasks() async {
//   await database.rawDelete('DELETE FROM tasks');
//   print('All tasks deleted!');
// }

 
}




