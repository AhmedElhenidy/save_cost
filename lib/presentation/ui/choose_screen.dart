
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_cost/presentation/ui/authentication/Sign_up_for_trips_screen.dart';
import 'package:save_cost/presentation/ui/sharing_cost_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/settings/settings_screen.dart';
import 'package:save_cost/presentation/ui/shopping_screen.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       elevation: 4,
       //leading:
      //Icon(Icons.arrow_back_outlined),
       title: Text(
         'enjoy with your app',
         style:TextStyle(color: Colors.white) ,
         //Theme.of(context).textTheme.bodyText1,
       ),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>SettingScreen()));
              },

            ),
          ],
        //hexColor
        //#54AD45
      backgroundColor: Colors.green,
      //HexColor("#54AD45"),
      //Colors.green[500],
     ),
     body:ListView(
       children:
       [
         Container(
           padding: EdgeInsetsDirectional.only(top: 55,start: 10,),
           child: Text(
             'Choose one...',
             style:Theme.of(context).textTheme.subtitle2,
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
                         image: AssetImage('assets/images/shopping.jpg'),
                         height:200,
                         width: 250,

                         ),

                       Container(

                        // color:  Colors.grey[400],
                         color:Colors.grey.withOpacity(.9),
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
                         image: AssetImage('assets/images/save_cost.jpg'),
                         height:200,
                         width: 250,
                        fit: BoxFit.fill,
                       ),
                       Container(
                         color:Colors.grey.withOpacity(.9),
                         padding: EdgeInsets.symmetric(
                           vertical: 5,

                         ),
                         width: double.infinity,
                         child: Text(
                           'Trips',
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
