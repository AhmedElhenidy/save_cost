import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import 'package:save_cost/presentation/components/profile/profile_widget.dart';
import 'package:save_cost/sharing_cost_screens/profile/profile.dart';
import '../../presentation/components/editing_profile/textfield_widget.dart';

class EditingProfilePage extends StatefulWidget {
  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  XFile ? imageFile ;
  User user = UserPreferences.myUser;
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
               getImage();
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
                 child: imageFile==null
                     ?
                 Icon(
                   Icons.add_photo_alternate,
                   color: Colors.white,
                   size: MediaQuery.of(context).size.width*.20 ,
                 ): null ,
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
           text : user.name,
           onChanged:(name){},
         ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (label: 'Phone',
             text: user.phone,
             onChanged: (phone){},
             ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (
           maxLines: 5,
             label: 'About',
             text: user.about,
             onChanged: (about){},
             ),
            SizedBox(height: 5,),
         defaultButton
           (
           background: Colors.purple[400],
           function: ()
           {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder:(context)=>Profile() ,
               ),

             );
           },
           text: "Update",
           radius: 20,
           width: 120,
         ),
       ],



     ),
   );
  }

  final ImagePicker imagePicker =ImagePicker();
  getImage ()async
  {
     imageFile= await imagePicker.pickImage( source:  ImageSource.gallery);

      setState(() {
        imageFile ;
        //= File (file!.path);
      });




  }

}
