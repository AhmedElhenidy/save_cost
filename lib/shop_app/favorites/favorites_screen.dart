
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/my_driver.dart';
import 'package:save_cost/shop_app/search/search_screen.dart';

class FavoritesScreen extends StatelessWidget {

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

      body:ListView.separated(
        itemBuilder: (context,index)=> BuildFavItem(),
        separatorBuilder:(context,index)=> myDivider() ,
        itemCount: 10,

      ),
    );
  }

  Widget BuildFavItem ({
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
              Image(
                image: AssetImage('assets/images/product2.jpg'),
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
                  'Stitch Detail Double Handle Square Bag',
                  style: TextStyle(
                    fontSize: 14,
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
                      'EGP 250',
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
                      onPressed: ()
                      {
                        print('ok');
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor:true? Colors.purple:Colors.grey,
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
}