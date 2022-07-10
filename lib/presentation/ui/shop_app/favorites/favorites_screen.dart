
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/domain/sqflite_services/favourites_service.dart';
import 'package:save_cost/presentation/components/my_driver.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';

class FavoritesScreen extends StatefulWidget {

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Product> products= [] ;
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
        itemBuilder: (context,index)=> BuildFavItem(product: products[index]),
        separatorBuilder:(context,index)=> myDivider() ,
        itemCount: products.length,

      ),
    );
  }

  Widget BuildFavItem({
    required Product product,
    bool isOldPrice = true,

  })  => Padding(
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

              if(1 !=0 && isOldPrice)
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
                  maxLines: 2,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  children: [
                    // NEW PRICE
                    Text(
                      'EGP ${product.price}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.purple,
                      ),

                    ),
                    SizedBox(
                      width: 5.0,
                    ),

                    // OLD PRICE
                    if( 1 !=0 && isOldPrice)
                      Text(
                        'EGP 350',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
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