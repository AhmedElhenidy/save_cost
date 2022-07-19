
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/components/my_driver.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var formKey=GlobalKey<FormState>();

  var searchController = TextEditingController();

  final reference =  FirebaseFirestore.instance.collection('shopping').orderBy('name');
  List<Product> products= [] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:
            [
              TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value){
                  setState((){});
                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.background,
                    ),),

                  label:  Text(
                    'Search',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  prefixIcon: (
                       Icon(
                        Icons.search ,
                         color: Theme.of(context).iconTheme.color,
                      )
                  ),

                ),
                // obscureText: isPassword,

              ),
              SizedBox(
                height: 10.0,
              ),
              //if(state is searchLoadingState)
              //LinearProgressIndicator(),
              FutureBuilder<QuerySnapshot>(
                future: reference.startAt([searchController.text])
                    .endAt([searchController.text +'\uf8ff'])
                    .get(),
                builder: (context,snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                     return Container();
                    case ConnectionState.waiting:
                      return LinearProgressIndicator();
                    case ConnectionState.active:
                      return Container(
                      );
                    case ConnectionState.done:
                      if(snapshot.hasData){
                       List<Product> searchList =  snapshot.data!.docs.map((e) => Product.fromJson(e)).toList();
                        return  Expanded(
                          child: ListView.separated(
                            itemBuilder: (context,index)=>InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ProductDetailsScreen(searchList[index])));
                              },
                                child: BuildSearchItem(product: searchList[index])),
                            separatorBuilder:(context,index)=>myDivider() ,
                            itemCount: snapshot.data!.docs.length,
                          ),
                        );
                      }else
                      {
                        return Text("No data found");
                      }

                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget BuildSearchItem ({
    required Product product,
    bool isOldPrice =false ,
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
              Image(
                image: NetworkImage(product.image??""),
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
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5,),
                Text(
                  '- ' + product.description.toString(),
                  style: TextStyle(
                    fontStyle:FontStyle.normal ,
                    fontSize: 12,
                    height: 1.3,
                  ),
                  maxLines: 2,
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
                    // IconButton(
                    //   onPressed: ()
                    //   {
                    //     print('ok');
                    //   },
                    //   icon: CircleAvatar(
                    //     radius: 15.0,
                    //     backgroundColor:true? Colors.grey:Colors.grey,
                    //     child: Icon(
                    //       Icons.favorite,
                    //       size: 20.0,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //
                    //
                    // ),
                  ],
                ),
                Spacer(),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}