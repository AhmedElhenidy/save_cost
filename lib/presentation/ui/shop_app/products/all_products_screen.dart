import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/category_model.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/domain/sqflite_services/favourites_service.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';

class AllProductsScreen extends StatefulWidget {
  String categoryId;

  AllProductsScreen(this.categoryId,{Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<Product> products= [] ;
  List<CategoryModel> categories = [] ;
  bool loading = false;
  bool error = false;
  getDataFromFireStore()async{
    List<Product> tempProductList = [];
    Product tempProduct ;
    setState(() {
      loading = true;
    });
    await FavouriteServices().getFavouriteProducts().then((value){
      tempProductList.clear();
      tempProductList.addAll(value);
    },);
    await FirebaseFirestore.instance.collection("categories").get().then((value)async{
      categories.clear();
      value.docs.forEach((element) {
        log(element["name"]);
        categories.add(CategoryModel.fromJson(element));
      });
      await  FirebaseFirestore.instance.collection("shopping").where("categoryID",isEqualTo:widget.categoryId).get().then((value){
        products.clear();
        value.docs.forEach((element) {
          log(element["name"]);
          tempProduct = Product.fromJson(element);
          tempProduct.isFavourite = tempProductList.where((element) => element.name == tempProduct.name).toList().isNotEmpty;
          products.add(tempProduct);
        });
        setState(() {
          loading = false;
        });
      });
    },onError: (err){
      setState(() {
        error = true;
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category Products',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          // child: Text(''
          //   ,
          //   style: TextStyle(
          //     fontSize: 20.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),

        ],
      ),

        // FutureBuilder<QuerySnapshot>(
        //   future: FirebaseFirestore.instance.collection("categories").get(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        //     return
        //     Container(
        //       height: 20,
        //       width: 20,
        //       child: ListView.separated(
        //         itemBuilder: (context,index)
        //         {
        //           return Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //           //'${categories[index].name}',
        //                 'Category Products',
        //                 //style:  Theme.of(context).textTheme.bodyText1,
        //                style: TextStyle(
        //                  color: Colors.black,
        //                   fontSize: 20.0,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //
        //               // child: Text(''
        //               //   ,
        //               //   style: TextStyle(
        //               //     fontSize: 20.0,
        //               //     fontWeight: FontWeight.bold,
        //               //   ),
        //               // ),
        //
        //             ],
        //           );
        //         },
        //         separatorBuilder: (context,index)=>SizedBox(),
        //         itemCount: 1,
        //
        //       ),
        //     );
        //   }),

        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>SearchScreen()));
            }
            , icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: error
            ?
        const Center(child: Text("Error!"),)
            :
        loading
            ?
        const Center(child: CircularProgressIndicator(),)
            :
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
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
                    color:Theme.of(context).scaffoldBackgroundColor,
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
                                style:Theme.of(context).textTheme.subtitle1,
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
                                    onPressed: () async
                                    {
                                      if( products[index].isFavourite == true){
                                        var result = await FavouriteServices().deleteProductFromFavourites(products[index].name!);
                                        if(result != 0){
                                          log(result.toString(),name: "FromIcon Button delete");
                                          setState((){
                                            products[index].isFavourite = false;
                                          });
                                        }
                                        else{
                                          log(result.toString(),name: "FromIcon Button else");
                                        }
                                      }
                                      else{
                                        var result = await FavouriteServices().addToFavourite(products[index]);
                                        if(result != 0){
                                          log(result.toString(),name: "FromIcon Button");
                                          setState((){
                                            products[index].isFavourite = true;
                                          });
                                        }
                                        else{
                                          log(result.toString(),name: "FromIcon Button else");
                                        }
                                      }
                                      print('ok');
                                    },
                                    icon: CircleAvatar(
                                      radius: 15.0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20.0,
                                        color: products[index].isFavourite?Colors.purple:Colors.white,
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
          ),
        ),
      ),

      // FutureBuilder<QuerySnapshot>(
      //   future: FirebaseFirestore.instance.collection("shopping").where("categoryID",isEqualTo:widget.categoryId).get(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     switch(snapshot.connectionState)
      //     {
      //       case ConnectionState.none:
      //         return SizedBox();
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
      //         return  Padding(
      //           padding: const EdgeInsets.all(12.0),
      //           child: Container(
      //             height: 300,
      //             width: MediaQuery.of(context).size.width,
      //             child: GridView.builder(
      //               scrollDirection:Axis.vertical,
      //               itemCount: products.length,
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 1.0,
      //                 crossAxisSpacing: 16.0,
      //                 childAspectRatio: 1/1.2,
      //               ),
      //
      //
      //               //physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return InkWell(
      //                   onTap: (){
      //                     Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProductDetailsScreen(products[index])));
      //                   },
      //                   child: Container(
      //                     color:Theme.of(context).scaffoldBackgroundColor,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Stack(
      //                           alignment: AlignmentDirectional.bottomStart,
      //                           children: [
      //                             Image(
      //                               image: NetworkImage(products[index].image??""),
      //                               width: double.infinity,
      //                               height: 100,
      //
      //                             ),
      //
      //                             if(products[index].discount !="0")
      //                               Container(
      //                                 color: Colors.red,
      //                                 padding: EdgeInsets.symmetric(horizontal: 5.0),
      //                                 child: Text(
      //                                   'DISCOUNT',
      //                                   style:TextStyle(
      //                                     fontSize:8.0,
      //                                     color: Colors.white,
      //                                   ),
      //                                 ),
      //                               ),
      //                           ],
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(12.0),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 products[index].name??""+"\n"+
      //                                     products[index].description!+"\n"+
      //                                     products[index].size!+"\n",
      //                                 style:Theme.of(context).textTheme.subtitle1,
      //                                 maxLines: 2,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //
      //                               Row(
      //                                 children: [
      //                                   Text(
      //                                     products[index].price.toString()+ '\tEGP',
      //                                     style: TextStyle(
      //                                       fontSize: 12,
      //                                       color: Colors.purple,
      //                                     ),
      //
      //                                   ),
      //                                   SizedBox(
      //                                     width: 5.0,
      //                                   ),
      //                                   //if(product.discount !=0)
      //                                   // Text(
      //                                   //   '350',
      //                                   //   style: TextStyle(
      //                                   //     fontSize: 10.0,
      //                                   //     color: Colors.grey,
      //                                   //     decoration: TextDecoration.lineThrough,
      //                                   //   ),
      //                                   //
      //                                   // ),
      //                                   Spacer(),
      //                                   IconButton(
      //                                     onPressed: () async
      //                                     {
      //                                       if( products[index].isFavourite == true){
      //                                         var result = await FavouriteServices().deleteProductFromFavourites(products[index].name!);
      //                                         if(result != 0){
      //                                           log(result.toString(),name: "FromIcon Button delete");
      //                                           setState((){
      //                                             products[index].isFavourite = false;
      //                                           });
      //                                         }
      //                                         else{
      //                                           log(result.toString(),name: "FromIcon Button else");
      //                                         }
      //                                       }
      //                                       else{
      //                                         var result = await FavouriteServices().addToFavourite(products[index]);
      //                                         if(result != 0){
      //                                           log(result.toString(),name: "FromIcon Button");
      //                                           setState((){
      //                                             products[index].isFavourite = true;
      //                                           });
      //                                         }
      //                                         else{
      //                                           log(result.toString(),name: "FromIcon Button else");
      //                                         }
      //                                       }
      //                                       print('ok');
      //                                     },
      //                                     icon: CircleAvatar(
      //                                       radius: 15.0,
      //                                       backgroundColor: Colors.grey,
      //                                       child: Icon(
      //                                         Icons.favorite,
      //                                         size: 20.0,
      //                                         color: products[index].isFavourite?Colors.purple:Colors.white,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //         );
      //
      //
      //     }
      //   },
      // ),
    );
  }
}
