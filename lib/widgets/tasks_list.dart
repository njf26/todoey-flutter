import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
                title: taskItem.name,
                isChecked: taskItem.isDone,
                checkBoxCallback: (bool checkBoxState) {
                  taskData.updateTask(taskItem);
                },
                deleteCallback: () {
                  taskData.deleteTask(index);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
