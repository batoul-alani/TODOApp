import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TasksScreen extends StatelessWidget {
  final _auth=FirebaseAuth.instance;
  @override
  void dispose(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         showModalBottomSheet(context: context, builder: (context) => AddTask(
           // setState(() {
           //   tasks.add(Task(name: newTaskTitle));
           //   Navigator.pop(context);
           // });
         ));
        },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.account_circle),
            onPressed: (){
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<String>(
                  future: Provider.of<TaskData>(context).getCurrentUser(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                    if(snapshot.hasData){
                      return Text(snapshot.data);
                    }
                    else{
                      return Text('lpading user now');
                    }
                  }
                ),
              ],
            ),
        // Text('Welcome ${Provider.of<TaskData>(context).getCurrentUser()}',
        //   style: TextStyle(
        //     fontSize: 12.0,
        //   ),
        // ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[

            Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoey',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                ),

                Text('${Provider.of<TaskData>(context).taskCount} task',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
             Expanded(
               child: Container(
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0))
                 ),
                 child: TaskList(),
               ),
             ),
          ]
        ),
      ),
    );
  }
}

