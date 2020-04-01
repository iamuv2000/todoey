import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget{

  final bool isChecked;
  final String taskTitle ;
  Function checkBoxCallback;
  Function deleteItem;
  TaskTile({this.isChecked, this.taskTitle ,this.checkBoxCallback, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteItem,
      title: Text(
          taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        )
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallback
      ),
    );
  }
}
