
import 'package:flutter/material.dart';

class SignUpForTripsScreen extends StatelessWidget {
  const SignUpForTripsScreen({Key? key}) : super(key: key);

  // var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(
          Icons.arrow_back,
        ),
    onPressed:(){},
        ),

        title: Text(
          'Home',
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.person_pin))
        ],

      ),

      body:

      Padding(

        padding: const EdgeInsets.all(20.0),

        child: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              TextFormField(
                /// controller: emailController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.person_sharp,
                  ),

                  border: OutlineInputBorder(),

                ),
              ),


              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                /// controller: emailController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Number',
                  prefixIcon: Icon(
                    Icons.add_call,
                  ),

                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                /// controller: emailController,
                keyboardType:TextInputType.number ,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'National Number',

                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                /// controller: emailController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (String value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Work address',
                  prefixIcon: Icon(
                    Icons.work,
                  ),

                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.end ,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                   color: Colors.teal,
                    width: 70,
                    height: 45,

                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18.0,
                          backgroundColor: Colors.teal,


                          color: Colors.white,
                        ),
                      ),),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}