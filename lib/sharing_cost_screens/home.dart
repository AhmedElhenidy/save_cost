import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripsHome extends StatefulWidget {  @override
  State<TripsHome> createState() => _TripsHomeState();
}

class _TripsHomeState extends State<TripsHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',
        style: TextStyle(color:Colors.white, ),),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person),

              ),
              title:Container(margin: EdgeInsets.only(top: 10),child: Text('Name'),) ,
              trailing: Icon(Icons.list),
              subtitle: Text('Email Address '),



            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 25,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Place: Cairo',
                  style: TextStyle(fontSize: 20),),
                  Text('Date: 22-6-2022',
                    style: TextStyle(fontSize: 20),),
                  Text('Time: 11:00',
                    style: TextStyle(fontSize: 20),),
                  Text('Car Model: Honda',
                    style: TextStyle(fontSize: 20),),
                  Image(image: NetworkImage('https://imgd.aeplcdn.com/1056x594/n/cw/ec/27074/civic-exterior-right-front-three-quarter-148156.jpeg?q=75&wm=1'),)

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                Container(

                  color: Colors.teal,
                  child: MaterialButton(
                    onPressed: (){},child: Text('check',
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(

                  color: Colors.teal,
                  child: MaterialButton(
                    onPressed: (){},child: Text('Chat for details',
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
              ],),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person),

              ),
              title:Container(margin: EdgeInsets.only(top: 10),child: Text('Name'),) ,
              trailing: Icon(Icons.list),
              subtitle: Text('Email Address '),



            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 25,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Place: Alex',
                    style: TextStyle(fontSize: 20),),
                  Text('Date: 22-7-2022',
                    style: TextStyle(fontSize: 20),),
                  Text('Time: 8:00',
                    style: TextStyle(fontSize: 20),),
                  Text('Car Model: Jeep',
                    style: TextStyle(fontSize: 20),),
                  Image(image: NetworkImage('https://di-uploads-pod26.dealerinspire.com/tacomadodgechryslerjeepram/uploads/2019/11/2019-Jeep-Compass-Sport-FWD-hero-image-e1554389792526.png'),)

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                  Container(

                    color: Colors.teal,
                    child: MaterialButton(
                      onPressed: (){},child: Text('check',
                      style: TextStyle(color: Colors.white),
                    ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(

                    color: Colors.teal,
                    child: MaterialButton(
                      onPressed: (){},child: Text('Chat for details',
                      style: TextStyle(color: Colors.white),
                    ),
                    ),
                  ),
                ],),
            ),

          ],
        ),
    );
  }}
