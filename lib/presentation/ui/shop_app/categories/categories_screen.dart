
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/category_model.dart';
import 'package:save_cost/presentation/ui/shop_app/products/all_products_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';



class CategoriesScreen extends StatelessWidget {
  List<CategoryModel> categories= [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>SearchScreen()));
            },

          ),
        ],
      ),
      body:FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("categories").get(),
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
              categories.clear();
              snapshot.data?.docs.forEach((element) {
                log(element["name"]);
                categories.add(CategoryModel.fromJson(element));
              });
              return  ListView.separated(
                padding: EdgeInsets.all(16),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index) {
                  return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AllProductsScreen(categories[index].id??"1")));
                    },
                    child: Row
                      (
                      children:
                      [
                        Image(
                          image:NetworkImage(categories[index].imageURl??""),
                          height: 120,
                          width:120 ,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '${categories[index].name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,


                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index)=>
                    SizedBox(
                  width: 10.0,
                ),
                itemCount: categories.length,
              );


          }
        },
      ),
      // body: ListView.separated(
      //     itemBuilder: (context,index)=> buildCatItem(),
      //     separatorBuilder:(context,index)=> myDivider() ,
      //     itemCount: 10,
      //
      // ),
    );
  }
  // Widget buildCatItem()=>Padding(
  //   padding: const EdgeInsets.all(20.0),
  //   child: Row(
  //     children:
  //     [
  //       Image(
  //         image: AssetImage('assets/images/laptop.jpg'),
  //         height: 120,
  //         width:120 ,
  //         fit: BoxFit.fitWidth,
  //       ),
  //       SizedBox(
  //         width: 20.0,
  //       ),
  //       Text(
  //         'Title',
  //         style: TextStyle(
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       Spacer(),
  //       Icon(
  //         Icons.arrow_forward_ios,
  //       ),
  //     ],
  //   ),
  // );
}
