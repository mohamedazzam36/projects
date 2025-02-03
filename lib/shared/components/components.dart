import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/cubit.dart';
import 'package:flutter_application_1/modules/todo_list/cubit/states.dart';

import '../../modules/todo_list/cubit/states.dart';


Widget defaultButton ({
double width = double.infinity,
Color background = Colors.blue,
bool isUpperCase = true,
double redius = 3,
double height = 40,
required Function() function,
required String text,
}) => 
Container(
  height: height,
  width: width,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(redius),
          ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white
             ),
 ),
 ),
);

Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType keyboard,
  bool isPassword = false,
  required String labelText,
  required IconData prefixIcon,
  IconData? suffixIcon  ,
  void Function(String)? onChanged,
  void Function(String)? onPressed,
  String? Function(String?)? validator, 
  Function()? suffixPressed,
  void Function()? onTap,
  bool readOnly=false,

}) =>  TextFormField(
                    readOnly: readOnly,
                    onTap: onTap ,
                    controller: controller ,
                    validator: validator,
                    onChanged:onChanged,
                    onFieldSubmitted: onPressed,
                    keyboardType: keyboard,
                    obscureText: isPassword ? true : false,
                    decoration: 
                    InputDecoration(
                      labelText: labelText,
                      suffixIcon: IconButton(
                        onPressed:suffixPressed,
                        icon: Icon(
                          suffixIcon,
                        ),
                        ),
                      prefixIcon: Icon(
                        prefixIcon,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  );    


Widget buildTaskItem(Map model, context){
  return Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction){
      AppCubit.get(context).deleteData(
        id: model['id']
        );
    },
    child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: 
          [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${model['time']}',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ), 
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
               
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: (){
                AppCubit.get(context).updateData(
                  status: 'done', 
                  id: model['id'],
                  );
              } , 
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              )
              ),      
            IconButton(
              onPressed: (){
                AppCubit.get(context).updateData(
                  status: 'archived', 
                  id: model['id'],
                  );
              } , 
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              )
              ),
         
          ],
        ),
      ),
  );

}                 