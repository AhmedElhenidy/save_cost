import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context)=>IntrinsicHeight(

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children:<Widget>[
        buildButton(context, '4.8','Ranking'),
        buildDivider(),
        buildButton(context, '3','Followers'),
        buildDivider(),
        buildButton(context, '5','Posts'),

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