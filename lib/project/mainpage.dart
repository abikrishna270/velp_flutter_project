import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'blooddonars.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('choose your needs',style: TextStyle(color: Colors.black),),
       backgroundColor: Colors.redAccent,

     ),

     body: Padding(
       padding: const EdgeInsets.all(50.0),
       child: Container(
         child: GridView(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
           children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepagee()));
               },
               child: Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20), color: Colors.red,
                 ),
               ),
             ),
           ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                  height: 200,
                 width: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),color: Colors.blueAccent,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),   color: Colors.grey,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
         child: Column(
           children: [
             Icon(Icons.add),
             Text('animal adoption')
           ],
         ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20), color: Colors.green,
                 ),
               ),
             ),
             SizedBox(height: 50,),

               Container(
                 width: 500,
                 child: Marquee(

                   text: 'Warning: Do not pay any amount to any person and does not collect money for any service.'
                       ' This app  is totally free',
                   crossAxisAlignment: CrossAxisAlignment.start,
                   blankSpace: 20.0,
                   velocity: 80.0,
                   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                   fadingEdgeStartFraction: 0.1,
                   fadingEdgeEndFraction: 0.1,
                   startPadding: 10,
                   accelerationDuration: Duration(seconds: 1),
                   accelerationCurve: Curves.linear,
                   decelerationDuration: Duration(milliseconds: 500),
                   decelerationCurve: Curves.easeOut,

                 ),
               ),
           ],
         ),
       ),

     ),

   );
  }
}
