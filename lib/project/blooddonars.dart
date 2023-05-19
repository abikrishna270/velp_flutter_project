import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepagee extends StatefulWidget {
  const Homepagee({Key? key}) : super(key: key);

  @override
  State<Homepagee> createState() => _HomepageeState();
}


class _HomepageeState extends State<Homepagee> {
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("blood donation"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/a');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add,size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream:donor.snapshots(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data!.docs.length,
              itemBuilder: (context,index){
                  final DocumentSnapshot donorSnap=snapshot.data.docs[index];
                  return Container(
                    height: 80,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                            child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 30,
                                child: 
                                Text(donorSnap['group']),
                            )),

                      ],
                    ),
                  );

              },

            );
    }
            return Container();

        },),
    );
  }
}
