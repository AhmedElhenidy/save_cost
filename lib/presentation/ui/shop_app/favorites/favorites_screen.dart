
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/category_model.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/domain/sqflite_services/favourites_service.dart';
import 'package:save_cost/presentation/components/my_driver.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/products/all_products_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';

class FavoritesScreen extends StatefulWidget {

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Product> products= [] ;
  List<CategoryModel> categories= [] ;
  bool loading = false;
  bool error = false;
  getDataFromOfflineDB()async{
    setState(() {
      loading = true;
    });
    await FavouriteServices().getFavouriteProducts().then((value){
      products.clear();
      products.addAll(value);
      setState(() {
        loading = false;
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
    getDataFromOfflineDB();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Favorites'),
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

      body:error
          ?
      const Center(child: Text("Error!"),)
          :
      loading
          ?
      const Center(child: CircularProgressIndicator(),)
          :
      ListView.separated(
        itemBuilder: (BuildContext context,int index){
           return InkWell(
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProductDetailsScreen(products[index])));
             // Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProductDetailsScreen(products[index])));
            },
            child: BuildFavItem(product: products[index]));
        },
            separatorBuilder:(BuildContext context,int index)=> myDivider(),
            itemCount: products.length,
      ),
    );
  }

  Widget BuildFavItem({
    required Product product,
    bool isOldPrice = true,
  })  =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,

          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image.network(
                    product.image??"",
                    width: 120,
                    height: 120,
                    // fit: BoxFit.cover,

                  ),

                  //if(1 !=0 && isOldPrice)
                  if(product.discount != "0")
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
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     product.name??"",
                      style:Theme.of(context).textTheme.bodyText1 ,
                      // TextStyle(
                      //   fontSize: 14,
                      //   height: 1.3,
                      // ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      product.description??"",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        if(product.discount !="0")
                        Row(
                          children: [
                            Text(
                              'EGP ${product.price}',
                              style: TextStyle(
                                fontSize: 10,
                                //color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                              ),

                            ),
                            if( 1 !=0 && isOldPrice)
                              Text(
                                '\tEGP ' + (product.price! *(1-double.parse(product.discount!)*.01)).toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.purple,

                                ),

                              ),
                          ],
                        ),
                        // OLD PRICE
                        if(product.discount == "0")
                          Text(
                            '\tEGP '+ product.price!.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                        Spacer(),
                        IconButton(
                          onPressed: () async{
                            var result = await FavouriteServices().deleteProductFromFavourites(product.name!);
                            if(result != 0){
                              log(result.toString(),name: "FromIcon Button delete");
                              setState((){
                                products.remove(product);
                              });
                            }
                            else{
                              log(result.toString(),name: "FromIcon Button else");
                            }
                            print('ok');
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor:true? Colors.grey:Colors.grey,
                            child: Icon(
                              Icons.favorite,
                              size: 20.0,
                              color: Colors.purple,
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
}