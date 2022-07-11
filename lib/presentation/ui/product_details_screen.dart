import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/presentation/ui/shop_app/search/search_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
 final Product myProduct;

   ProductDetailsScreen(this.myProduct,{Key? key}) : super(key: key);


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Details'),
          ],
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  alignment: AlignmentDirectional.bottomStart,

                children:[
                  Image(
                    image: NetworkImage(widget.myProduct.image!),
                  width: double.infinity,
                  height: 200,
                ),

                  if(widget.myProduct.discount !="0")
                        Container(

                          color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            '\tDISCOUNT  ' + widget.myProduct.discount!+'\t%',
                            style:TextStyle(
                              fontSize:10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),


                  ]
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     IconButton(
              //       onPressed: ()
              //       {
              //         print('ok');
              //       },
              //       icon: CircleAvatar(
              //         radius: 15.0,
              //         backgroundColor: Colors.grey,
              //         child: Icon(
              //           Icons.favorite_border,
              //           size: 15.0,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text (
                      widget.myProduct.name! + '\t  -  '+widget.myProduct.color!,
                    style: TextStyle(
                      fontSize: 15,

                    ),
                  ),
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
              SizedBox(
                height: 10,
              ),
              //color
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Color',
                      ),
                      Container(

                        padding: EdgeInsets.all(2.5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(

                              color: Color(0xFF356C95)),
                        ),
                        child:
                        DecoratedBox(
                          decoration: BoxDecoration(
                            //color: widget.myProduct.color! ,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 15,
              ),
              // brand
              Row(
                children: [
                  Text(
                    '\tBrand: ',
                    style: TextStyle(
                     fontSize: 13,
                    ),
                  ),
                  Text(
                    widget.myProduct.seller!,
                    style: TextStyle(

                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //price
              Row(
                children:
                [

                  // Text(
                  //      '\tEGP '+ widget.myProduct.price!.toString(),
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),

                  if(widget.myProduct.discount !="0")
                     Row(
                      children: [
                        Text(
                          '\tEGP ' + widget.myProduct.price!.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\tEGP ' + (widget.myProduct.price! *(1-double.parse(widget.myProduct.discount!)*.01)).toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  if(widget.myProduct.discount == "0")
                  Text(
                       '\tEGP '+ widget.myProduct.price!.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\tRate: '+ widget.myProduct.rate!+'\t',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              RatingBar.builder(
                initialRating: double.parse(widget.myProduct.rate!),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (double value ) {
                   print(value);
                   },
              ),
              SizedBox(
                height: 15,
              ),
              // Description
              Text(
                  'Description',
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ) ,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [

                  Expanded(
                    child:
                        Text(
                      widget.myProduct.description!,
                      style: TextStyle(
                        fontSize: 16,
                        //height: 1.3,
                        color: Colors.grey[730],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\t- Size: '+ widget.myProduct.size!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\t- Address: '+ widget.myProduct.seller!+ '\t at '+widget.myProduct.address!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\t- Quantity of this product: '+ widget.myProduct.quantity!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }






  // Widget sss ()=> Scaffold(
  //   appBar: AppBar(
  //
  //     title: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text('Details'),
  //       ],
  //     ),
  //     actions: [
  //       IconButton(
  //         onPressed: (){
  //           Navigator.push(context, MaterialPageRoute(builder: (builder)=>SearchScreen()));
  //         }
  //         , icon: Icon(Icons.search),
  //       ),
  //     ],
  //   ),
  //   body: Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Stack(
  //             alignment: AlignmentDirectional.bottomStart,
  //             children:[
  //               Image(
  //                 image: NetworkImage(widget.myProduct.image!),
  //                 width: double.infinity,
  //                 height: 200,
  //               ),
  //               if(widget.myProduct.discount !="0")
  //                 Container(
  //                   color: Colors.red,
  //                   padding: EdgeInsets.symmetric(horizontal: 5.0),
  //                   child: Text(
  //                     '\tDISCOUNT  ' + widget.myProduct.discount!+'\t%',
  //                     style:TextStyle(
  //                       fontSize:10.0,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //             ]
  //         ),
  //         //Text( widget.myProduct.name!),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 widget.myProduct.description!,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   height: 1.3,
  //                   color: Colors.grey[750],
  //                 ),
  //                 maxLines: 3,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 15,
  //         ),
  //         Row(
  //           children: [
  //             Text(
  //               '\tBrand: ',
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             Text(widget.myProduct.seller!,
  //               style: TextStyle(
  //                 color: Colors.blue,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 15,
  //         ),
  //         Row(
  //           children:
  //           [
  //             Text(
  //               '\tEGP '+ widget.myProduct.price!.toString(),
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             // if(widget.myProduct.discount !="0")
  //             //    Row(
  //             //     children: [
  //             //       Text(
  //             //         '\tEGP ' + widget.myProduct.price!.toString(),
  //             //         style: TextStyle(
  //             //           fontSize: 20,
  //             //           fontWeight: FontWeight.bold,
  //             //           decoration: TextDecoration.lineThrough,
  //             //         ),
  //             //       ),
  //             //       SizedBox(
  //             //         width: 10,
  //             //       ),
  //             //       Text(
  //             //         '\tEGP ' +" ${
  //             //               widget.myProduct.price!.toString() *
  //             //                   widget.myProduct.discount!
  //             //             }",
  //             //         style: TextStyle(
  //             //           fontSize: 20,
  //             //           fontWeight: FontWeight.bold,
  //             //         ),
  //             //       ),
  //             //     ],
  //             //   ),
  //
  //
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  //
  // );
}
