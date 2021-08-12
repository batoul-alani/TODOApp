import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore=FirebaseFirestore.instance;
User loggedInUser;

class TaskTitle extends StatelessWidget {
  final _auth=FirebaseAuth.instance;

  final bool firstvalue;
  final String taskTitle;

  final Function checkboxCallback;
  final Function longPressCallback;
  TaskTitle({this.firstvalue,this.taskTitle,this.checkboxCallback,this.longPressCallback});

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async{
    try{
      User user=await FirebaseAuth.instance.currentUser;
      if(user!=null){
        loggedInUser=user;
        print(loggedInUser);
      }
    }
    catch(e){
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
          taskTitle,
        style: TextStyle(
          decoration: firstvalue==true?TextDecoration.lineThrough:null,
        ),

      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: firstvalue,
        onChanged: (newValue){
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
