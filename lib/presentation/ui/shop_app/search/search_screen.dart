
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/my_driver.dart';

class SearchScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var searchController = TextEditingController();

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
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Text to search';
                  }

                  return null;
                },
                onFieldSubmitted: (String text)
                {

                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  label: const Text(
                    'Search',
                  ),
                  prefixIcon: (
                      const Icon(
                        Icons.search ,
                      )
                  ),

                ),
                // obscureText: isPassword,

              ),
              SizedBox(
                height: 10.0,
              ),
              //if(state is searchLoadingState)
              LinearProgressIndicator(),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context,index)=>BuildSearchItem(),
                  separatorBuilder:(context,index)=>myDivider() ,
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildSearchItem ({
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