import 'package:flutter/material.dart';

Widget defaultButton({

  double width= double.infinity,
  Color background= Colors.teal,
  required VoidCallback function,
  required String text,
  double radius = 0.0,
  bool isUpperCase = true,
}
    ) =>Container(
  width: width,
  height: 40,
  //color: background,
  child: MaterialButton(
    onPressed:function,

    child: Text (
      isUpperCase? text.toUpperCase():text,
      style: const TextStyle(
        //backgroundColor: Colors.blue,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius,),
    color: background,
  ),
);