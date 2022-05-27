
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/category_model.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';
import 'package:save_cost/shop_app/products/all_products_screen.dart';
import 'package:save_cost/shop_app/search/search_screen.dart';

class ProductsScreen extends StatelessWidget {
  List<CategoryModel> categories= [] ;
  List<Product> products= [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextFormField(
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (builder)=>SearchScreen()));
          },

          decoration: InputDecoration(

            filled: true,
            fillColor: Colors.white,
            labelText: 'search',
            prefixIcon: Icon(
              Icons.search,
            ),

          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
             CarouselSlider(
               items: [
                 Image(
                   image: AssetImage('assets/images/shop_app4.webp'),
                   width: double.infinity,
                   fit: BoxFit.cover,
                 ),
                 Image(
                   image: AssetImage('assets/images/shop_app.png'),
                   width: double.infinity,
                   fit: BoxFit.cover,
                 ),

                 Image(
                   image: AssetImage('assets/images/shop_app3.jpg'),
                   width: double.infinity,
                   fit: BoxFit.cover,
                 ),

               ],
               options: CarouselOptions(
                 height: 200,
                 initialPage: 0,
                 viewportFraction: 1.0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayInterval: Duration(seconds: 3),
                 autoPlayAnimationDuration: Duration(seconds: 1),
                 autoPlayCurve: Curves.fastOutSlowIn,
                 scrollDirection: Axis.horizontal,
               ),

             ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder<QuerySnapshot>(
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
                          return  Container(
                            height: 100.0,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index) {
                               return  InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AllProductsScreen(categories[index].id??"1")));
                                 },
                                 child: Stack(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    children:
                                    [
                                      Image(
                                        image: NetworkImage(categories[index].imageURl??""),
                                        height: 100,
                                        width:100 ,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Container(
                                        color:Colors.black.withOpacity(.8),

                                        width: 100.0,
                                        child: Text(
                                          '${categories[index].name}',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,

                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                               );
                              },
                              separatorBuilder: (context,index)=> SizedBox(
                                width: 10.0,
                              ),
                              itemCount: categories.length,
                            ),
                          );


                      }
                    },
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder<QuerySnapshot>(
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
                    return  Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
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

          ],
        ),
      ),
    );

  }
  Widget buildCategoryItem() =>Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children:
    [
      Image(
        image: AssetImage('assets/images/laptop.jpg'),
        height: 100,
        width:100 ,
        fit: BoxFit.fitWidth,
      ),
      Container(
        color:Colors.black.withOpacity(.8),

        width: 100.0,
        child: Text(
          'Electronics',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
