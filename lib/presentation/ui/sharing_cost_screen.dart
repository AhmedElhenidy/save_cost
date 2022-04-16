
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/defualt_form_field.dart';
import 'package:save_cost/presentation/ui/trip_result_screen.dart';

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

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.teal,

    title: Center(child: Text('Participate me cost ')),
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(Icons.notifications),
      ),
    ],
    ),
    body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
                label: 'Destination',
              controller: titleController,
              type:TextInputType.text,

              validate: null,
              prefix:Icons.title ,


            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
              // onTap: (){
              //   showDatePicker(
              //     context: context,
              //     initialDate: DateTime.now(),
              //     firstDate: DateTime.now(),
              //
              //     lastDate: DateTime.parse('2025-04-20'),
              //   ).then((value) {
              //     print(DateFormat.yMMMd().format(value));
              //     dateController.text=DateFormat.yMMMd().format(value);
              //   } );
              // },
              label: 'Date',
              type:TextInputType.text,
              controller: dateController,
              validate: null,
              prefix:Icons.calendar_today ,


            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
              // onTap: (){
              //   showTimePicker(
              //     context: context,
              //     initialTime: TimeOfDay.now(),
              //
              //   ).then((value) {
              //     timeController.text= value.format(context).toString();
              //   } );
              // },
              label: 'Time',
              type:TextInputType.text,
              controller: timeController,
              validate: null,
              prefix:Icons.watch_later_outlined ,


            ),
          ),
          Container(
            color: Colors.teal,
            child: MaterialButton(

              onPressed: (){
                Navigator.push(
                  context,
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return TripResult();
                        }),

                );
              },
              minWidth: 100,
              child: const Text('Post',
              style: TextStyle(
                  color: Colors.white,
                fontSize: 22,
              ),
              ),


            ),
          ),


        ],
      ),





  );

  }
}
