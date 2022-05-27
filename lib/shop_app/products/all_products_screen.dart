import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';

class AllProductsScreen extends StatefulWidget {
  String categoryId;
  AllProductsScreen(this.categoryId,{Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<Product> products= [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("shopping").where("categoryID",isEqualTo:widget.categoryId).get(),
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
              return  Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  scrollDirection:Axis.vertical,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 1/1.2,
                  ),


                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProductDetailsScreen(products[index])));
                      },
                      child: Container(
                        color:Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image(
                                  image: NetworkImage(products[index].image??""),
                                  width: double.infinity,
                                  height: 100,

                                ),

                                if(products[index].discount !="0")
                                  Container(
                                    color: Colors.red,
                                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text(
                                      'DISCOUNT',
                                      style:TextStyle(
                                        fontSize:8.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].name??""+"\n"+
                                        products[index].description!+"\n"+
                                        products[index].size!+"\n",
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        products[index].price.toString()+ '\tEGP',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.purple,
                                        ),

                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      //if(product.discount !=0)
                                      // Text(
                                      //   '350',
                                      //   style: TextStyle(
                                      //     fontSize: 10.0,
                                      //     color: Colors.grey,
                                      //     decoration: TextDecoration.lineThrough,
                                      //   ),
                                      //
                                      // ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: ()
                                        {
                                          print('ok');
                                        },
                                        icon: CircleAvatar(
                                          radius: 15.0,
                                          backgroundColor: Colors.grey,
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );


          }
        },
      ),
    );
  }
}
