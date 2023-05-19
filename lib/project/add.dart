import 'package:flutter/material.dart';
class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  final Bloodgrp=['A+','B+'];
   String ? selectedlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text("add user"),
      backgroundColor: Colors.red,
    ),
  body: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text('donar name')
  ),
  ),

      ),
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
    keyboardType: TextInputType.number,
        maxLength: 10,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('number')
        ),
      ),),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: DropdownButtonFormField(
            decoration: InputDecoration(
              label: Text('selected blood grp')
            ),
            items: Bloodgrp.map((e)=>DropdownMenuItem(child: Text(e),
        value: e,)).toList(), onChanged:(val){
          selectedlist=val;
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(onPressed: (){},
            style:ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
    child:
        Text('submit')),
      )
    ],
  ),
    );
  }
}
