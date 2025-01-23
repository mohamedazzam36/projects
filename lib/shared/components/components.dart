import 'package:flutter/material.dart';


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

}) =>  TextFormField(
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
                 