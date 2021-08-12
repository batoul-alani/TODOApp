import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screens/login_screen.dart';
import 'screens/task_screen.dart';
import 'models/task_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskData(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
