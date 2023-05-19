import 'package:flutter/material.dart';
import 'package:lastgod/project/add.dart';
import 'package:lastgod/project/blooddonars.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lastgod/project/login%20page.dart';
import 'package:lastgod/project/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData)  {
            return const MainPage();
          }else
          {

            return const LoginPage();

          }
        },
      ),

    );
  }
}
