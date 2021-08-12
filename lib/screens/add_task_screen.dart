import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTask extends StatelessWidget {
  // final Function addTaskCallback;
  // AddTask(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 25.0,
              ),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.lightBlueAccent,
              textAlign: TextAlign.center,
              onChanged: (String newText){
                newTaskTitle=newText;
              },
            ),
            SizedBox(height: 10.0,),
            FlatButton(
              onPressed: (){
                Provider.of<TaskData>(context,listen:false).addTask(newTaskTitle);
                Navigator.pop(context);
                //addTaskCallback(newTaskTitle);
              },
              color: Colors.lightBlueAccent,
              child: Text(
              'Add task',
                style: TextStyle(
                  color: Colors.white,
                ),
            ),),
          ],
        ),
      ),
    );
  }
}
