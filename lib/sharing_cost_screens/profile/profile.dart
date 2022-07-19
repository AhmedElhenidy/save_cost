import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  UserModel user = UserModel();
  @override
  Widget build(BuildContext context) {
    final user2 = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Profile',),
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body:Container(
        child: ListView(
           physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 10,),

            const SizedBox(height: 24,),
            // buildName(user),
            // const SizedBox(height: 24,),
            // NumbersWidget(),
            // const SizedBox(height: 24,),
            // buildAbout(user),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection("users").where("id",isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
              builder: ( context,  snapshot) {
                switch(snapshot.connectionState)
                {
                  case ConnectionState.none:
                    return SizedBox();
                  case ConnectionState.waiting:
                    return Center(
                      child: Text("Loading...."),
                    );
                  case ConnectionState.active:
                    return SizedBox();
                  case ConnectionState.done:

                    log("${snapshot.data?.docs.length.toString()}");
                    log("${FirebaseAuth.instance.currentUser?.uid}");
                    snapshot.data?.docs.forEach((element) {
                      log(element["id"]);
                       user = UserModel.fromJson(element);
                    });
                    return  Container(
                      child: Column(
                        // physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(height: 10,),
                          ProfileWidget(
                            imagePath: user.image??"",
                            onClicked: () async {
                              bool isChanged = await  Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> EditingProfilePage(user)),
                              );
                              if(isChanged){
                                setState((){});
                              }
                            },
                          ),
                          const SizedBox(height: 24,),
                          buildName(user),
                          const SizedBox(height: 24,),
                          NumbersWidget(),
                          const SizedBox(height: 24,),
                          buildAbout(user)
                        ],
                      ),
                    );





                }
              },
            ),




          ],
        ),
      ),

    );
  }
 // final UserModel myUser;
  //List<UserModel> users= [] ;
  //widget.myUsers.userName
  Widget buildName(UserModel user) =>
  //     ListView.separated(
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
  //   itemCount: users.length,
  //
  // );
      Column(
    children:
    [
      Text(
        //myUser.userName!,
        //"${users[index].userName}",
        user.userName??"",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:30,
        ),
      ),
      const SizedBox(height: 4.0,),
      Text(
        user.phoneNumber??"",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      const SizedBox(height: 4.0,),
      Text(
        user.email??"",
        style: TextStyle(
          color: Colors.grey,

        ),
      ),

    ],
  );




Widget buildAbout (UserModel user)=>Container(
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
        user.about??"",
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