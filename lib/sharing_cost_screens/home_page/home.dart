import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/trip_post_model.dart';
import 'package:save_cost/domain/model/user_model.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import 'package:save_cost/presentation/ui/sharing_cost_screen.dart';

class TripsHome extends StatefulWidget
{
  //String userId;
 // TripsHome(this.userId,{Key? key}) : super(key: key);

  @override
State<TripsHome> createState() => _TripsHomeState();
}

class _TripsHomeState extends State<TripsHome> {
  List<Post> posts= [] ;
  List<UserModel> users = [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Home',
          ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body:FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("posts").get(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              posts.clear();
              snapshot.data?.docs.forEach((element) {
                log(element["from"]);
                posts.add(Post.fromJson(element));
              });
              return  ListView.separated(
                  padding: EdgeInsets.all(16),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return Container(

                      child: Column(
                        children: <Widget>
                        [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Icon(Icons.person,
                                //color: Theme.of(context).iconTheme.color,
                                color: Colors.white,
                              ),

                            ),
                            title:Container(margin: EdgeInsets.only(top: 10),
                              child: Text('Name',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),) ,
                            subtitle: Text(
                              'Email Address ',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            trailing: MaterialButton(

                              child: Icon(Icons.more_vert,),

                              onPressed: ()
                              {
                                showDialog<String>(
                                  context:context,
                                  builder: (BuildContext context) => AlertDialog(

                                    title: MaterialButton(
                                      child: Center(child: const Text('Delete'),),


                                      onPressed: (){


                                        Navigator.pop(context);

                                        showDialog<String>(
                                          context:context,
                                          builder: (BuildContext context) => AlertDialog(

                                            title: const Text('Do you want to delete post ?'),

                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text('Cancel', ),
                                              ),
                                              TextButton(
                                                onPressed: () =>Navigator.pop(context),
                                                child: const Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.red
                                                  ),),
                                              ),
                                            ],
                                          ),

                                        );


                                      },

                                    ),


                                  ),

                                );


                              },



                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 25,
                              end: 25,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('From: ',
                                      style: TextStyle(fontSize: 20,
                                        fontStyle:FontStyle.italic,
                                      ),
                                    ),
                                    Text('${posts[index].from}',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('To: ',
                                      style: TextStyle(fontSize: 20,
                                        fontStyle:FontStyle.italic,
                                      ),
                                    ),
                                    Text('${posts[index].to}',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Date:  ',
                                      style: TextStyle(fontSize: 20,
                                        fontStyle:FontStyle.italic,
                                      ),
                                    ),
                                    Text('${posts[index].date}',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Time: ',
                                      style: TextStyle(fontSize: 20,
                                        fontStyle:FontStyle.italic,
                                      ),
                                    ),
                                    Text('${posts[index].time}',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Car Model: ',
                                      style: TextStyle(fontSize: 20,
                                        fontStyle:FontStyle.italic,
                                      ),
                                    ),
                                    Text('${posts[index].carModel}',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                 // height: 200,
                                 // width: 200,
                                  child: Image(
                                    image: NetworkImage(
                                        'https://imgd.aeplcdn.com/1056x594/n/cw/ec/27074/civic-exterior-right-front-three-quarter-148156.jpeg?q=75&wm=1'),),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 5),
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children:<Widget> [
                                Container(

                                  height: 40,
                                  color: Colors.purple,
                                  child:
                                  //
                                  // defaultButton
                                  //   (
                                  //   function: ()
                                  //   {
                                  //   },
                                  //   text: "Join",
                                  //   radius: 20,
                                  //   width: 100,
                                  // ),
                                  MaterialButton(

                                    onPressed: (){
                                      showDialog<String>(
                                        context:context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('If you want to join my trip, that is my '
                                              'Phone Number'),
                                          content: const Text('01061960884',
                                            style: TextStyle(fontSize: 16,
                                              color: Colors.purple,
                                            ),),
                                        ),
                                      );

                                    },
                                    child: Row(
                                      children: [
                                        Text('Join',
                                          style:
                                          TextStyle(color: Colors.white,),

                                        ),
                                        SizedBox(width: 10,),

                                        Icon(
                                          Icons.mobile_friendly_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                                SizedBox(width: 20,),
                                // Container(
                                //
                                //   color: Colors.teal,
                                //   child: MaterialButton(
                                //     onPressed: (){},child: Text('Chat for details',
                                //     style: TextStyle(color: Colors.white),
                                //   ),
                                //   ),
                                // ),
                              ],),
                          ),
                          //SizedBox(height: 40,),
                          buildDivider(),



                        ],
                      ),

                    );
                  },
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 10,
                  ),
                  itemCount: posts.length
              ) ;





          }
        },
      ),

    );
  }
  Widget buildDivider() => Container(
      height: 24,

      child: Divider(
        color: Theme.of(context).iconTheme.color,
        // color: Colors.black45,
        thickness: 1.5,
      ));
}