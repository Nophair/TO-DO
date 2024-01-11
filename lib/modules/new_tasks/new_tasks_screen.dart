import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
     listener: (context, state){},
      builder: (context, state){
       var tasks = AppCubit.get(context).newTasks;
       return ConditionalBuilder(
           condition: tasks.isNotEmpty,
           builder: (context) => ListView.separated(
             itemBuilder: (context, index) => buildNewTaskItem(tasks[index], context),
             separatorBuilder: (context, index) => SizedBox(height: 5,),
             itemCount: tasks.length,
           ),
           fallback: (context) => Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(
                   Icons.menu,
                   size: 70.0,
                   color: Colors.grey,
                 ),
                 Text(
                   'No Tasks Yet, Please Add Some Tasks',
                   style: TextStyle(
                     fontFamily: 'NoyhR',
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.grey,
                   ),
                 ),
               ],
             ),
           ),
       );
      },
    );
  }
}