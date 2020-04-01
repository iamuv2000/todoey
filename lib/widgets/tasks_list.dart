import 'package:flutter/material.dart';
import './tasks_tile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context , taskData, child){
        return ListView.builder(itemBuilder: (context ,index){
          final task = taskData.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked : task.isDone,
              checkBoxCallback: (checkBoxState) {
                taskData.updateTask(task);
              },
              deleteItem: () {
                Provider.of<TaskData>(context, listen: false).deleteTask(task);
              }
          );
        }, itemCount: taskData.taskCount,);
      },
    );
  }
}