import 'package:flutter/material.dart';
import 'package:todoey/models/sign_up_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:todoey/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class SignInScreen extends StatefulWidget {

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth=FirebaseAuth.instance;

  String email='';
  String database='';
  String password='';
  bool showSpannerInLogInScreen=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: ModalProgressHUD(
        inAsyncCall: showSpannerInLogInScreen,
        child: ListView(
          children: <Widget>[
            // TextField(
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecoration(
            //     helperText: 'Which you register it',
            //     hintText: 'Enter your database Label',
            //     hintStyle: TextStyle(
            //       color: Colors.black45,
            //     ),
            //     helperStyle: TextStyle(
            //       color: Colors.black38,
            //     ),
            //   ),
            //   textAlign: TextAlign.center,
            //   cursorColor: Colors.lightBlueAccent,
            //   autofocus: true,
            //   onChanged: (String inputDataBase){
            //     database=inputDataBase;
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
                email=inputEmail;
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
                password=inputPassword;
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
                onPressed: () async{
                try{
                  final user=(await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
                  //final data=(await _auth.signInWithCustomToken(database)).user;
                  if(user !=null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TasksScreen()));
                  }
                }
                catch(e){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  print(e);
                }
                },
                child: Text(
                  'Sign in',
                ),),
            SizedBox(
              height: 5.0,
            ),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5.0),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                //Provider.of<TaskData>(context).getNavigator(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },
              child: Text(
                  'OR Sign up Now'
              ),),
          ],
        ),
      ),
    );
  }
}
