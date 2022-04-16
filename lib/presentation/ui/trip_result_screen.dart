import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripResult extends StatefulWidget {
  const TripResult({Key? key}) : super(key: key);
  @override
  State<TripResult> createState() => _TripResultState();
}

class _TripResultState extends State<TripResult> {
  bool check = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('trips'),


      ),
      body: Row(
        children: [
          MaterialButton(
              onPressed: () {
                setState(() {
                  check=!check;
                });
              },
              child: Icon(check? Icons.crop_square: Icons.check)
          ),

          Text(
            'Go to Alex',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 30,

            ),
          ),








        ],
      ),
    );
  }}
