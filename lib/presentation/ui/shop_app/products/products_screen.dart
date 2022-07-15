
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/category_model.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/domain/sqflite_services/favourites_service.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/products/all_products_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<CategoryModel> categories= [] ;

  List<Product> products= [] ;
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
     await  FirebaseFirestore.instance.collection("shopping").get().then((value){
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        //elevation: 1,
        title: Container(
          height: 45,
          child: TextFormField(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (builder)=>SearchScreen()));
            },

            decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10)
               ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              //labelText: 'Search',
               label: Text(
                 'Search',
                 style: Theme.of(context).textTheme.subtitle1,
               ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
              ),

            ),
          ),
        ),
        actions: [],
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
        Column(
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
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
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
                                color:Theme.of(context).backgroundColor,

                                width: 100.0,
                                child: Text(
                                  '${categories[index].name}',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: Theme.of(context).textTheme.bodyText1,
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
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Products',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              //height: 300,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1/1.3,
                ),


                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProductDetailsScreen(products[index])));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
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
                            child: Container(
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

                                         // print('ok');
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
