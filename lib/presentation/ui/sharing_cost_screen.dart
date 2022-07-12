
import 'package:flutter/material.dart';
import 'package:save_cost/sharing_cost_screens/add_post/add_post.dart';
import 'package:save_cost/sharing_cost_screens/home_page/home.dart';
import 'package:save_cost/sharing_cost_screens/profile/profile.dart';




class SharingCost extends StatefulWidget {
  const SharingCost({Key? key}) : super(key: key);

  @override
  State<SharingCost> createState() => _SharingCostState();
}

class _SharingCostState extends State<SharingCost> {
  @override
var titleController = TextEditingController();
var timeController = TextEditingController();

var dateController = TextEditingController();
int _currentIndex =0;
List<Widget> _widgetOptions = <Widget>[
  TripsHome(),
  // ChekedTrip(),
  AddTrip(),
  Profile(),
];

  Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(backgroundColor: Colors.white,
    //
    // title: Center(child: Text('Participate me cost ')),
    // actions: [
    //   Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Icon(Icons.notifications),
    //   ),
    // ],
    // ),
    body: _widgetOptions.elementAt(_currentIndex),
      // Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: defaultFormField(
      //           label: 'Destination',
      //         controller: titleController,
      //         type:TextInputType.text,
      //
      //         validate: null,
      //         prefix:Icons.title ,
      //
      //
      //       ),
      //     ),
      //
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: defaultFormField(
      //         // onTap: (){
      //         //   showDatePicker(
      //         //     context: context,
      //         //     initialDate: DateTime.now(),
      //         //     firstDate: DateTime.now(),
      //         //
      //         //     lastDate: DateTime.parse('2025-04-20'),
      //         //   ).then((value) {
      //         //     print(DateFormat.yMMMd().format(value));
      //         //     dateController.text=DateFormat.yMMMd().format(value);
      //         //   } );
      //         // },
      //         label: 'Date',
      //         type:TextInputType.text,
      //         controller: dateController,
      //         validate: null,
      //         prefix:Icons.calendar_today ,
      //
      //
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: defaultFormField(
      //         // onTap: (){
      //         //   showTimePicker(
      //         //     context: context,
      //         //     initialTime: TimeOfDay.now(),
      //         //
      //         //   ).then((value) {
      //         //     timeController.text= value.format(context).toString();
      //         //   } );
      //         // },
      //         label: 'Time',
      //         type:TextInputType.text,
      //         controller: timeController,
      //         validate: null,
      //         prefix:Icons.watch_later_outlined ,
      //
      //
      //       ),
      //     ),
      //     Container(
      //       color: Colors.teal,
      //       child: Padding(
      //         padding: const EdgeInsets.all(5.0),
      //         child: MaterialButton(
      //
      //           onPressed: (){
      //             Navigator.push(
      //               context,
      //                 MaterialPageRoute(
      //                     builder: (BuildContext context) {
      //                       return TripResult();
      //                     }),
      //
      //             );
      //           },
      //           // minWidth: double.infinity,
      //           child: const Text('Post',
      //           style: TextStyle(
      //               color: Colors.white,
      //             fontSize: 22,
      //           ),
      //           ),
      //
      //
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //     Container(
      //       color: Colors.teal,
      //       child: MaterialButton(
      //
      //         onPressed: (){
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return TripResult();
      //                 }),
      //
      //           );
      //         },
      //         minWidth: double.infinity,
      //         child: const Text('show available trips',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 22,
      //           ),
      //         ),
      //
      //
      //       ),
      //     ),
      //
      //
      //
      //   ],
      // ),
    bottomNavigationBar:BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
        //BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'checked',),
        BottomNavigationBarItem(icon: Icon(Icons.add),label: 'add post',),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_people),label: 'profile',),

      ],
      currentIndex: _currentIndex,
      onTap: _changeItem,

    ) ,





  );

  }

  void _changeItem(int value) {

    print(value);
    setState(() {
      
      _currentIndex= value;
      
    });
  }
}
