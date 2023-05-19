import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
 @override
void dispose(){
   _emailController.dispose();
   _passwordController.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vhelp', style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),),
            Text("Login to our app", style: TextStyle(
                color: Colors.black,
                fontSize: 44,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 44,),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "user email",
                  prefixIcon: Icon(Icons.mail, color: Colors.black,)
              ),
            ),
            SizedBox(height: 26,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "user password",
                  prefixIcon: Icon(Icons.lock, color: Colors.black,)
              ),
            ),
            SizedBox(height: 10,),
            Text('Dont remember the password',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 14,),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                ),
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim());
                },
                child: Text('login', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                ),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                ),
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim());
                },
                child: Text('register', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                ),),
              ),
            ),


          ],
        ),),
    );
  }}


