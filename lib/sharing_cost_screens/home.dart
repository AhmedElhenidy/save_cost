import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/default_button.dart';

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
                child: Icon(Icons.person,
                  color: Theme.of(context).iconTheme.color,),

              ),
              title:Container(margin: EdgeInsets.only(top: 10),
                child: Text('Name',
                  style: Theme.of(context).textTheme.bodyText1,
                ),) ,
              trailing: Icon(Icons.list),
              subtitle: Text(
                'Email Address ',
                style: Theme.of(context).textTheme.subtitle1,
              ),



            ),
               Padding(
    padding: const EdgeInsetsDirectional.only(
    start: 25,
    end: 25,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Text('Place: ',
    style: TextStyle(fontSize: 20,
    fontStyle:FontStyle.italic,
    ),
    ),
    Text('Cairo',
    style: TextStyle(
    fontSize: 16,

    ),
    ),
    ],
    ),
    Row(
    children: [
    Text('Date:  ',
    style: TextStyle(fontSize: 20,
    fontStyle:FontStyle.italic,
    ),
    ),
    Text('22-6-2022',
    style: TextStyle(
    fontSize: 16,

    ),
    ),
    ],
    ),
    Row(
    children: [
    Text('Time: ',
    style: TextStyle(fontSize: 20,
    fontStyle:FontStyle.italic,
    ),
    ),
    Text('11:00 ',
    style: TextStyle(
    fontSize: 16,

    ),
    ),
    ],
    ),
    Row(
    children: [
    Text('Car Model: ',
    style: TextStyle(fontSize: 20,
    fontStyle:FontStyle.italic,
    ),
    ),
    Text('Honda',
    style: TextStyle(
    fontSize: 16,

    ),
    ),
    ],
    ),
    SizedBox(height: 10,),

    Container(
    child: Image(
    image: NetworkImage(
    'https://imgd.aeplcdn.com/1056x594/n/cw/ec/27074/civic-exterior-right-front-three-quarter-148156.jpeg?q=75&wm=1'),),
    )

    ],
    ),
    ),
           SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                Container(

                  color: Colors.teal,
                  child:

                  defaultButton
                    (
                    function: ()
                    {
                    },
                    text: "Join",
                    radius: 20,
                    width: 100,
                  ),
                  // MaterialButton(
                  //
                  //   onPressed: (){},child: Text('check',
                  //   style:
                  //   TextStyle(color: Colors.white,),
                  //
                  // ),
                  // ),
                ),
                SizedBox(width: 20,),
                // Container(
                //
                //   color: Colors.teal,
                //   child: MaterialButton(
                //     onPressed: (){},child: Text('Chat for details',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   ),
                // ),
              ],),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person,
                color: Theme.of(context).iconTheme.color,),

              ),
              title:Container(margin: EdgeInsets.only(top: 10),child:
              Text('Name',
                style: Theme.of(context).textTheme.bodyText1,),
                ) ,
              trailing: Icon(Icons.list),
              subtitle: Text('Email Address ',
                style: Theme.of(context).textTheme.subtitle1,
              ),



            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 25,
                end: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Place: ',
                        style: TextStyle(fontSize: 20,
                          fontStyle:FontStyle.italic,
                        ),
                      ),
                      Text('Cairo',
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Date:  ',
                        style: TextStyle(fontSize: 20,
                          fontStyle:FontStyle.italic,
                        ),
                      ),
                      Text('22-6-2022',
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Time: ',
                        style: TextStyle(fontSize: 20,
                          fontStyle:FontStyle.italic,
                        ),
                      ),
                      Text('11:00 ',
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Car Model: ',
                        style: TextStyle(fontSize: 20,
                          fontStyle:FontStyle.italic,
                        ),
                      ),
                      Text('Honda',
                        style: TextStyle(
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Container(
                    child: Image(
                      image: NetworkImage(
                          'https://imgd.aeplcdn.com/1056x594/n/cw/ec/27074/civic-exterior-right-front-three-quarter-148156.jpeg?q=75&wm=1'),),
                  )

                ],
              ),
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                  Container(

                    color: Colors.teal,
                    child:
                    defaultButton
                      (

                      function: ()
                      {

                      },
                      text: "Join",
                      radius: 20,
                      width: 100,
                    ),
                    // MaterialButton(
                    //
                    //   onPressed: (){},child: Text('check',
                    //   style:
                    //   TextStyle(color: Colors.white,),
                    //
                    // ),
                    // ),
                  ),
                  SizedBox(width: 20,),
                  // Container(
                  //
                  //   color: Colors.teal,
                  //   child: MaterialButton(
                  //     onPressed: (){},child: Text('Chat for details',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   ),
                  // ),
                ],),
            ),

          ],
        ),
    );
  }}
