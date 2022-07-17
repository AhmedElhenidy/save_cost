import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:save_cost/presentation/components/defualt_form_field.dart';
import 'package:save_cost/presentation/ui/sharing_cost_screen.dart';
import 'package:save_cost/sharing_cost_screens/home_page/home.dart';

class AddTrip extends StatefulWidget {  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  File ? imageFile;
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var CarController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isClicked = false;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Add Post',
          ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body:
      loading?CircularProgressIndicator():ListView(
        children:[
          Form(
            key: formKey,
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                TextFormField(
                  controller: fromController,
                  keyboardType:TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Current place must not be empty';

                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder() ,

                    prefixIcon: Icon(
                      Icons.title,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label:  Text(
                      'From ',
                        style: Theme.of(context).textTheme.subtitle1,),
                  ) ,


                ),

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                TextFormField(
                  controller: toController,
                  keyboardType:TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Target place must not be empty';

                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder() ,
                    // focusedBorder: OutlineInputBorder(
                    //   // borderRadius: BorderRadius.circular(25.0),
                    //   borderSide: BorderSide(
                    //     color: Theme.of(context).colorScheme.background,
                    //   ),),
                    prefixIcon: Icon(
                      Icons.title,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label:  Text(
                      'To',
                      style: Theme.of(context).textTheme.subtitle1,),
                  ) ,


                ),
                // defaultFormField(
                //   label: 'Destination',
                //   controller: titleController,
                //   type:TextInputType.text,
                //
                //   validate: (value){
                //     if(value!.isEmpty){
                //       return 'Destination must not be empty';
                //
                //     }
                //     return null;
                //   },
                //   prefix: Icons.title ,
                // ),

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
                    prefixIcon: Icon(Icons.calendar_today ,
                      color: Theme.of(context).iconTheme.color,),

                    label:  Text('Date',
                      style: Theme.of(context).textTheme.subtitle1,),
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
                      prefixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Theme.of(context).iconTheme.color,

                  ),

                      label:  Text('Time',
                        style: Theme.of(context).textTheme.subtitle1,),
                         ) ,
                   keyboardType:TextInputType.text,

                    controller: timeController,




                )

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                  TextFormField(
                    controller: CarController,
                    keyboardType:TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Car model must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                      border:OutlineInputBorder() ,
                      prefixIcon: Icon(
                        Icons.car_repair,
                        color: Theme.of(context).iconTheme.color,

                      ),

                      label:  Text('Car Model',
                        style: Theme.of(context).textTheme.subtitle1,),
                    ) ,
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
              Container(
                child: ElevatedButton(
                  onPressed: ()=> getImage(source: ImageSource.gallery),
                  child: const Text(
                    'select car image from gallery',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.purple,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MaterialButton(

                    onPressed: () async {
                     //add post to firebase
                      if (formKey.currentState!.validate()&&imageFile!=null) {
                        String imageUrl = await uploadPhotoToFirebase(imageFile!);
                        await  FirebaseFirestore.instance.collection('posts').doc().set({
                           'from': fromController.text,
                           'to': toController.text,
                           'date': dateController.text,
                             'time': timeController.text,
                             'carModel': CarController.text,
                             'user': FirebaseAuth.instance.currentUser!.uid,
                           'image':imageUrl
                           },
                           );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return SharingCost();
                                }),

                          );
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
              SizedBox(height: 20,),
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

  Future<String> uploadPhotoToFirebase(File _image,) async {
    setState(() {
      loading =true;
    });
    final storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${_image.path}');
    UploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete((){ });
    return await storageReference.getDownloadURL();
  }


}
