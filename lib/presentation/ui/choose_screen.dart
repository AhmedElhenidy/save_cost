
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/ui/authentication/Sign_up_for_trips_screen.dart';
import 'package:save_cost/presentation/ui/sharing_cost_screen.dart';
import 'package:save_cost/presentation/ui/shopping_screen.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading:
       Icon(Icons.arrow_back_outlined),
       title: Text(
         'enjoy with your app',
         style: TextStyle(color: Colors.white,),
       ),
       backgroundColor:Colors.teal,
     ),
     body:ListView(
       children: [
         Container(
           padding: EdgeInsetsDirectional.only(top: 55,start: 10,),
           child: Text(
             'Choose one...',
             style: TextStyle(
               backgroundColor: Colors.teal,

               fontStyle:FontStyle.italic,

               color: Colors.white,
               fontSize: 30,

             ),
           ),
         ),
         SizedBox(height: 10,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment:CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12,)
                 ),
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                 width: 200,

                 child: InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (builder)=>ShoppingScreen()));

                   },
                   child: Stack(
                     alignment: Alignment.bottomCenter,

                     children: [

                       Image (
                         image: NetworkImage(

                         'https://previews.123rf.com/images/tigatelu/tigatelu1312/tigatelu131200182/24469377-%EC%98%A8%EB%9D%BC%EC%9D%B8-%EC%87%BC%ED%95%91-%EB%A7%8C%ED%99%94.jpg',
                         ),
                         height:200,
                         width: 250,

                         ),

                       Container(

                         color: Colors.grey.withOpacity(.9),
                         width: double.infinity,
                         padding: EdgeInsetsDirectional.only(top: 5,bottom: 5,),
                         child: Text(
                           'Shopping',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.white,

                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment:CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10,)

                 ),
                 clipBehavior: Clip.antiAliasWithSaveLayer,

                 width: 200,
                 child: InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (builder)=>SharingCost()));
                   },
                   child: Stack(
                     alignment: Alignment.bottomCenter,
                     children: [
                       Image (
                         image: NetworkImage(

                           'https://cdn4.vectorstock.com/i/1000x1000/63/08/with-money-cute-car-character-cartoon-vector-18236308.jpg',
                         ),
                         height:200,
                         width: 250,
                        fit: BoxFit.fill,
                       ),
                       Container(
                         color: Colors.blueGrey.withOpacity(.9),
                         padding: EdgeInsets.symmetric(
                           vertical: 5,

                         ),
                         width: double.infinity,
                         child: Text(
                           'Save Cost',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.white,

                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),


]
   ),
   );



  }

}
