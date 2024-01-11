import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget buildNewTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFF2fe48d),
            ),
            child: Center(child: Text(
                '${model['time']}',
              style: TextStyle(fontFamily: 'NoyhR',fontSize: 17.0,),
            ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'NoyhR',
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    fontFamily: 'NoyhR',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                id: model['id'],
                status: 'done',
              );
            },
            icon:  Icon(
              Icons.check_box_outline_blank ,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                id: model['id'],
                status: 'archive',
              );
            },
            icon: Icon(
              Icons.archive_outlined,
              color: Color(0xFF2fe48d),
            ),
          ),
        ],
      ),
    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);
Widget buildDoneTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFF2fe48d),
            ),
            child: Center(child: Text(
                '${model['time']}',
              style: TextStyle(fontFamily: 'NoyhR',fontSize: 17.0,),
            ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationColor: Color(0xFF2fe48d),
                    decorationThickness: 3.0,
                    fontFamily: 'NoyhR',
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    fontFamily: 'NoyhR',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                id: model['id'],
                status: 'new',
              );
            },
            icon:  Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);
Widget buildArchivedTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFF2fe48d),
            ),
            child: Center(child: Text(
                '${model['time']}',
              style: TextStyle(fontFamily: 'NoyhR',fontSize: 17.0,),
            ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'NoyhR',
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    fontFamily: 'NoyhR',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                id: model['id'],
                status: 'done',
              );
            },
            icon:  Icon(
              Icons.check_box_outline_blank ,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AppCubit.get(context).updateData(
                id: model['id'],
                status: 'new'
              );
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Color(0xFF2fe48d),
            ),
          ),
        ],
      ),
    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);