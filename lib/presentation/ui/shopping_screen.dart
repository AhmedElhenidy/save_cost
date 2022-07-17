import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/ui/shop_app/categories/categories_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/favorites/favorites_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/products/products_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/settings/settings_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<Product> products= [] ;
  int currentIndex=0;
  List<Widget> _WidgetOption =<Widget>
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      _WidgetOption.elementAt(currentIndex)
      // FutureBuilder<QuerySnapshot>(
      //   future: FirebaseFirestore.instance.collection("shopping").get(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     switch(snapshot.connectionState)
      //       {
      //       case ConnectionState.none:
      //       return SizedBox();
      //       case ConnectionState.waiting:
      //         return Center(
      //           child: Text("Loading...."),
      //         );
      //       case ConnectionState.active:
      //         return SizedBox();
      //       case ConnectionState.done:
      //         log("${snapshot.data?.docs.length.toString()}");
      //         products.clear();
      //         snapshot.data?.docs.forEach((element) {
      //           log(element["name"]);
      //           products.add(Product.fromJson(element));
      //         });
      //         return ListView.separated(
      //           separatorBuilder:(context, index) => SizedBox(
      //             width: 10.0,
      //           ) ,
      //             itemCount: products.length,
      //             itemBuilder: (context,index){
      //
      //           return InkWell(
      //               onTap: (){
      //                 Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductDetailsScreen(products[index])));
      //               },
      //               child: Image.network(products[index].image!,height: 300,width: 150,));
      //
      //         });
      //
      //
      //     }
      //   },
      // )
      ,
      bottomNavigationBar:BottomNavigationBar(
        onTap: changeItem,
        currentIndex: currentIndex,

        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.apps,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite,),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings,),
            label: 'Settings',
          ),
        ],) ,
    );
  }



  void changeItem (int value)
  {
    setState(()
    {
      currentIndex=value;
    });
  }

}
