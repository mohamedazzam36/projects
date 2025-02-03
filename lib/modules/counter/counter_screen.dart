import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/counter/cubit/cubit.dart';
import 'package:flutter_application_1/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
   

  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state){} ,
      builder: (context, state) {
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
                   CounterCubit.get(context).minus();
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
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: ()
                  {
                    CounterCubit.get(context).plus();
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
      },

      ),
    );
  }
}