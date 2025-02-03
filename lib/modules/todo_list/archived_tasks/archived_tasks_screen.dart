import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/cubit.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/states.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {  },
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context), 
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ), 
        itemCount: tasks.length,
        );
        },
     
    );
  
  }
}