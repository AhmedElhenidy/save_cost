import 'package:flutter/material.dart';

class ChekedTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checked trips',
       style: TextStyle(color:Colors.white ), ),
        backgroundColor: Colors.teal,
      ),
      body: Text('checked'),
    );
  }
}
