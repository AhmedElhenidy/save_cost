import 'package:flutter/material.dart';
import 'package:save_cost/sharing_cost_screens/profile_widget.dart';
import 'package:save_cost/sharing_cost_screens/user.dart';
import 'package:save_cost/sharing_cost_screens/user_preferences.dart';

import 'textfield_widget.dart';

class EditingProfilePage extends StatefulWidget {
  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 32),
       physics: BouncingScrollPhysics(),
       children: [
         ProfileWidget(
           imagePath: user.imagePath,
           isEdit:true,
           onClicked: () async {},
         ),
         const SizedBox(height: 24,),
         TextFieldWidget(
           label: 'Full Name',
           text : user.name,
           onChanged:(name){},
         ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (label: 'Email',
             text: user.email,
             onChanged: (email){},
             ),
         const SizedBox(height: 24,),
         TextFieldWidget
           (
           maxLines: 5,
             label: 'About',
             text: user.about,
             onChanged: (about){},
             ),



       ],
     ),
   );
  }}
