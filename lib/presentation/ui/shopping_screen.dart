import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<Product> products= [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("shopping").get(),
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
              products.clear();
              snapshot.data?.docs.forEach((element) {
                log(element["name"]);
                products.add(Product.fromJson(element));
              });
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){

                return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductDetailsScreen(products[index])));
                    },
                    child: Image.network(products[index].image!,height: 300,width: 150,));
              });

          }
        },
      ),
    );
  }
}
