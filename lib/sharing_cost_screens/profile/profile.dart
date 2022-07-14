import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/user_model.dart';
import 'package:save_cost/sharing_cost_screens/profile/editing_profile_page.dart';
import 'package:save_cost/presentation/components/profile/numbers_widget.dart';
import 'package:save_cost/presentation/components/profile/profile_widget.dart';



class Profile extends StatefulWidget {

  //final UserModel myUser;
 // List<UserModel> users= [] ;

 // Profile(this.myUser,{Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
  //widget.myProduct.discount
}

class _ProfileState extends State<Profile> {

  //List<UserModel> users = [] ;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final UserModel myUser;
     List<UserModel> users= [] ;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Profile',),
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body:ListView(
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
 // final UserModel myUser;
  List<UserModel> users= [] ;
  //widget.myUsers.userName
  Widget buildName(User user) =>   Column(
    children:
    [
      Text(
        //myUser.userName!,
        //"${users[index].userName}",
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
      // ListView.separated(
      //
      //   itemBuilder: (BuildContext context, int index) {
      //     return Column(
      //       children:
      //       [
      //         Text(
      //           //myUser.userName!,
      //           //"${users[index].userName}",
      //            user.name,
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize:30,
      //           ),
      //         ),
      //         const SizedBox(height: 4.0,),
      //         Text(
      //           user.phone,
      //           style: Theme.of(context).textTheme.bodyText1,
      //         ),
      //         const SizedBox(height: 4.0,),
      //         Text(
      //           user.email,
      //           style: TextStyle(
      //             color: Colors.grey,
      //
      //           ),
      //         ),
      //
      //       ],
      //     );
      //   },
      //   separatorBuilder: (BuildContext context, int index) { return SizedBox();  },
      //   itemCount: 1,
      //
      // );



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