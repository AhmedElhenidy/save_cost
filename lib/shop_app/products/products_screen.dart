
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/shop_app/search/search_screen.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) =>buildCategoryItem(),
                        separatorBuilder: (context,index)=> SizedBox(
                          width: 10.0,
                        ),
                        itemCount: 5,
                    ),
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
            Container(
              color:Colors.grey[300],
              child: GridView.count(

                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1/1.2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    color:Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(
                              image: AssetImage('assets/images/product3.jpg'),
                              width: double.infinity,
                              height: 100,

                            ),

                            //if(product.discount !=0)
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
                                'T-shirt with short sholder ,size:30 ,long:60 cm',
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
                                    'ENG 250',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.purple,
                                    ),

                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  //if(product.discount !=0)
                                  Text(
                                    '350',
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
                  )
                ],
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
