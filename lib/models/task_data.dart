
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
User loggedInUser;

class TaskData extends ChangeNotifier {
  final _auth=FirebaseAuth.instance;

    Future<String> getCurrentUser() async{
      //try{
      User user=await _auth.currentUser;
      if(user!=null){
        loggedInUser=user;
        final String currentUser= loggedInUser.email;
        print(loggedInUser.email);
        return currentUser;
      }
      //}
      // catch(e){
      //   print(e);
      // }
      notifyListeners();
    }


  bool showspanner=false;
  bool getshowspaneer(){
    return showspanner=! showspanner;
  }
  List <Task>tasks=[
    Task(name: 'Buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'buy eggs'),
  ];
  int get taskCount{
    return tasks.length;
  }
  void addTask(String newTaskTitle){
    final task=Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }
  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }


}