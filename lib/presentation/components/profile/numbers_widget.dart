import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NumbersWidget extends StatefulWidget{
  @override
  State<NumbersWidget> createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
   QuerySnapshot? posts;
  @override
  initState(){
    super.initState();
    FirebaseFirestore.instance.collection("posts").
   where("user",isEqualTo: FirebaseAuth.instance.currentUser?.uid).get().then((value){
     posts = value;
     setState((){});
   });

  }
  @override
  Widget build(BuildContext context)=>IntrinsicHeight(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children:<Widget>[
        buildButton(context, '4.8','Ranking'),
        buildDivider(),
        buildButton(context, '3','Followers'),
        buildDivider(),
        buildButton(context, posts==null?"55":posts!.docs.length.toString(),'Posts'),

      ],
    ),
  );

Widget buildDivider() => Container(
  height: 24,

    child: VerticalDivider());

buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      onPressed: (){},
      child:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget> [
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2,),
          Text(
            text,
            style: TextStyle( fontWeight: FontWeight.bold),
          ),

      ],
      ) ,
    );
}