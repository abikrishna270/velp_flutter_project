import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../community/communityadd.dart';
class CommunityView extends StatefulWidget {
  const CommunityView({Key? key}) : super(key: key);

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  final CollectionReference community=FirebaseFirestore.instance.collection('community');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("blood donation"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>communityAdd()));
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream:community.snapshots(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount:snapshot.data!.docs.length,
              itemBuilder: (context,index){
                final DocumentSnapshot communitySnap=snapshot.data.docs[index];
                return Container(
                  height: 80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            decoration: BoxDecoration(
                              border: Border.all()
                            ),
                            child: Padding(

                              padding: const EdgeInsets.all(8.0),
                              child: Text(communitySnap['community'],style: TextStyle(
                                    fontSize: 12
                                ),),
                            ),
                          ),




                        ],
                      ),

                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },),
    );
}}
