import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/sharing_cost_screens/editing_profile_page.dart';
import 'package:save_cost/sharing_cost_screens/numbers_widget.dart';
import 'package:save_cost/sharing_cost_screens/profile_widget.dart';
import 'package:save_cost/sharing_cost_screens/user.dart';
import 'package:save_cost/sharing_cost_screens/user_preferences.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(color:Colors.white ),),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 10,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> EditingProfilePage()),
              );
            },
          ),
          const SizedBox(height: 24,),
          buildName(user),
          const SizedBox(height: 24,),
          NumbersWidget(),
          const SizedBox(height: 24,),
          buildAbout(user),




        ],
      ),
    );
  }


  Widget buildName(User user) =>Column(children: [
    Text(
      user.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:24,
      ),
    ),
    const SizedBox(height: 4.0,),

    Text(
      user.email,
      style: TextStyle(
        color: Colors.grey,

      ),
    ),



  ],
  );
Widget buildAbout (User user)=>Container(
  padding: EdgeInsets.symmetric(horizontal: 48 ),
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Text(

    'About',

        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),



  ),



      SizedBox(height: 10,),

      Text(

        user.about,

        style: TextStyle(fontSize: 16,height: 1.4),

      )









    ],

  ),
);
}
