import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          return TaskTitle(
              taskTitle: taskData.tasks[index].name,
              firstvalue: taskData.tasks[index].isDone,
              checkboxCallback: (bool stateValue) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );

  }
}