import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/sharing_cost_screens/profile/editing_profile_page.dart';
import 'package:save_cost/presentation/components/profile/numbers_widget.dart';
import 'package:save_cost/presentation/components/profile/profile_widget.dart';



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
        elevation: 4,
        title: Text('Profile',),
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        fontSize:30,
      ),
    ),
    const SizedBox(height: 4.0,),
    Text(
      user.phone,
     style: Theme.of(context).textTheme.bodyText1,
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


// call user
class User {
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.about,
  });
}
//create user
class UserPreferences {
  static const myUser = User(
    imagePath: 'https://mobirise.com/bootstrap-template/profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    phone: '0102285588',
    about: 'certificated personal Trainer and Nutritionist with years of experience in creating effective diets   ',
  );


}