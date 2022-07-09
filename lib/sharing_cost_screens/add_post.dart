import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  var formKey = GlobalKey<FormState>();
  bool isClicked = false;


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
          Form(
            key: formKey,
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  label: 'Destination',
                  controller: titleController,
                  type:TextInputType.text,

                  validate: (value){
                    if(value!.isEmpty){
                      return 'Destination must not be empty';

                    }
                    return null;
                  },
                  prefix:Icons.title ,


                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onTap: ()
                  {
                    showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),

                              lastDate: DateTime.parse('2025-04-20'),
                            ).then((value) {
                              print(DateFormat.yMMMd().format(value!));
                              dateController.text=DateFormat.yMMMd().format(value);
                            } );
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Date must not be empty';

                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder() ,
                    prefixIcon: Icon(Icons.calendar_today ),

                    label: const Text('Date'),
                  ) ,
                  keyboardType:TextInputType.text,

                  controller: dateController,




                ),




              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                TextFormField(
                  onTap: ()
                  {
                    showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),

                            ).then((value) {
                              timeController.text= value!.format(context).toString();
                            } );
                  },
                   validator: (value){
                    if(value!.isEmpty){
                      return 'time must not be empty';

                    }
                    return null;
                   },
                  decoration: InputDecoration(
                    border:OutlineInputBorder() ,
                      prefixIcon: Icon(Icons.watch_later_outlined),

                      label: const Text('Time'),
                         ) ,
                   keyboardType:TextInputType.text,

                    controller: timeController,




                )

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(

                  label: 'Car Model',
                  type:TextInputType.text,
                  controller: CarController,
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Car model must not be empty';

                    }
                    return null;
                  },
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

                    onPressed: () async {
                     //add post to firebase

                      if (formKey.currentState!.validate()) {

                        var current_user =
                        await FirebaseAuth.instance.currentUser!;
                         FirebaseFirestore.instance.collection('posts').doc().set({
                             'place': titleController.text,
                             'date': dateController.text,
                             'time': timeController.text,
                             'car model': CarController.text,
                             'user': 'users/' + current_user.uid,

                           },


                           );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return SharingCost();
                                }),

                          );


                        setState(() {
                          isClicked = true;

                        });
                      }




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
      final path = file!.path;
      final fileName = file.name;
      print(path);
      print(fileName);

    }
  }




}
