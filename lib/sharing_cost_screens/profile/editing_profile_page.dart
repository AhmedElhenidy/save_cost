import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_cost/domain/model/user_model.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import '../../presentation/components/editing_profile/textfield_widget.dart';

class EditingProfilePage extends StatefulWidget {
  UserModel user;
  EditingProfilePage(this.user);
  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  File ? imageFile ;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 32),
       physics: BouncingScrollPhysics(),
       children: [
           GestureDetector(
             onTap: (){
               getImage(source: ImageSource.gallery);
             },
             child: Container
               (
               height: 150,
               width: 150,
               child: CircleAvatar(
                 radius: //80,
                 MediaQuery.of(context).size.width*.20,
                 backgroundColor: Colors.grey,
                 backgroundImage:
                 imageFile==null
                 ? null
                 : FileImage(
                    File(imageFile!.path)
                 ),
                 child:imageFile!=null
                     ? null
                     :
                 Icon(
                   Icons.add_photo_alternate,
                   color: Colors.white,
                   size: MediaQuery.of(context).size.width*.20 ,
                 ) ,
               ),
             ),
           ),

         // ProfileWidget(
         //   imagePath: user.imagePath,
         //   isEdit:true,
         //   onClicked: () async {
         //     imageFile==null
         //     getImage(source: ImageSource.gallery);
         //   },
         //
         // ),
         const SizedBox(height: 24,),
         TextFieldWidget(
           label: 'Full Name',
           text : widget.user.userName??"",
           onChanged:(name){
             widget.user.userName = name;
           },
         ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (label: 'Phone',
             text: widget.user.phoneNumber??"",
             onChanged: (phone){
               widget.user.phoneNumber = phone;
             },
             ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (
           maxLines: 5,
             label: 'About',
             text: widget.user.about??"",
             onChanged: (about){
               widget.user.about= about;
             },
             ),
            SizedBox(height: 5,),
         defaultButton
           (
           background: Colors.purple[400],
           function: () async
           {
             await  FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
               'userName': widget.user.userName??"",
               'about': widget.user.about??"",
               'phoneNumber': widget.user.phoneNumber??"",
             },
             );
             Navigator.pop(context,true);
           },
           text: "Update",
           radius: 20,
           width: 120,
         ),
       ],



     ),
   );
  }

  void getImage({required ImageSource source})async
  {
    final file = await ImagePicker().pickImage( source: source);
    if(file ?.path !=null){
      String url = await uploadPhotoToFirebase(File(file!.path));
      await  FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update({
        'image': url,
      },
      );
      Navigator.pop(context,true);
      final path = file.path;
      final fileName = file.name;
      print(path);
      print(fileName);

    }
  }

  Future<String> uploadPhotoToFirebase(File _image,) async {
    // setState(() {
    //   loading =true;
    // });
    final storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${_image.path}');
    UploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete((){ });
    return await storageReference.getDownloadURL();
  }


}
