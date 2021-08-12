import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/screens/task_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _auth=FirebaseAuth.instance;
  String new_email;
  String new_database;
  String new_password;
  bool showSpanner=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
      ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        child: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        radius: 30.0,
                      ),
                      Text('Todoey',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                ),


                Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                //this text field was for database label but depending on what i have searched for, there is no method to sign using database else so i need to clear all tasks when the task screen is open
                // TextField(
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //     hintText: 'Create your database Label',
                //     hintStyle: TextStyle(
                //       color: Colors.black45,
                //     ),
                //   ),
                //   textAlign: TextAlign.center,
                //   cursorColor: Colors.lightBlueAccent,
                //   autofocus: true,
                //   onChanged: (String inputDataBase){
                //     new_database=inputDataBase;
                //   },
                // ),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    helperText: 'Ex: name@gmail.com',
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    helperStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.lightBlueAccent,
                  onChanged: (String inputEmail){
                    new_email=inputEmail;
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.lightBlueAccent,
                  onChanged: (String inputPassword){
                    new_password=inputPassword;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5.0),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                  ),
                  onPressed: ()async{
                    setState(() {
                      showSpanner=true;
                    });
                    try{
                      final newUser=await _auth.createUserWithEmailAndPassword(email: new_email, password: new_password);

                      if(newUser!=null){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TasksScreen()));
                      }
                    }catch(e){}
                  },
                  child: Text(
                    'Register',
                  ),),
              ],
                ),
            ],
            ),
          ),
        ),
      );
  }
}
