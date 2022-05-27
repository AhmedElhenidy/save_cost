
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/my_driver.dart';
import 'package:save_cost/shop_app/search/search_screen.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
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
      body: ListView.separated(
          itemBuilder: (context,index)=> buildCatItem(),
          separatorBuilder:(context,index)=> myDivider() ,
          itemCount: 10,

      ),
    );
  }
  Widget buildCatItem()=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: AssetImage('assets/images/laptop.jpg'),
          height: 120,
          width:120 ,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          'Title',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
