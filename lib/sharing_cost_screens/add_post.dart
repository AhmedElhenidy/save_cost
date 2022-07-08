import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_cost/presentation/components/defualt_form_field.dart';
import 'package:save_cost/presentation/ui/sharing_cost_screen.dart';
import 'package:save_cost/sharing_cost_screens/home.dart';

class AddTrip extends StatefulWidget {  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  File ? imageFile;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var CarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post',
          style: TextStyle(color:Colors.white ),),
        backgroundColor: Colors.teal,
      ),
      body:
      ListView(
        children:[
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(

                label: 'Car Model',
                type:TextInputType.text,
                controller: CarController,
                validate: null,
                prefix:Icons.car_repair ,


              ),
            ),

              Column(

                children: [
                  if(imageFile!= null)
                  Container(
                    width: 400,
                    height: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: FileImage(imageFile!),
                        fit: BoxFit.fill,
                      ),

                      border: Border.all(width: 8, color: Colors.white,),

                    ),

                  )
                  else


                Container(
                   width: 400,
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,

                    border: Border.all(width: 8, color:Colors.white, ),

                  ),
                  child: const Text(
                        'your car image should appear here',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20,),

                ],
              ),


            ElevatedButton(

              onPressed: ()=> getImage(source: ImageSource.gallery),

              child: const Text('select car image from gallery',),
            ),
            Container(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(

                  onPressed: (){

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SharingCost();
                          }),

                    );
                  },
                  // minWidth: double.infinity,
                  child: const Text('Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),


                ),
              ),
            ),





          ],
        ),
              ],
      ),
    );

  }
  void getImage({required ImageSource source})async
  {
    final file = await ImagePicker().pickImage( source: source);
    if(file ?.path !=null){
      setState(() {
        imageFile = File(file!.path);
      });

    }
  }




}
