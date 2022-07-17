import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:save_cost/domain/firebase_services/firebase_authentication.dart';
import 'package:save_cost/presentation/components/defualt_form_field.dart';
import 'package:save_cost/presentation/ui/choose_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  bool isVisible = true;
  bool isClicked = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
          title: const Text(
            'Register now',
          ),


      ),
      body:  Center(

        child: Padding(

          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'Register now and discover app',
                    style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[500],

                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    Color: Theme.of(context).textTheme.bodyText1?.color,
                    controller: usernameController,
                   label: 'userName',
                    prefix: Icons.person_sharp,

                    type: TextInputType.name,
                    validate: (value){
                      if (value!.isEmpty){
                        return'Please enter a username.';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  defaultFormField(
                    Color: Theme.of(context).textTheme.bodyText1?.color,
                    controller: emailController,
                    label: 'Email Address',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (value){
                      if (value!.isEmpty){
                        return'Please enter an email address.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }

                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      // isDense: false,
                      // contentPadding: const EdgeInsets.symmetric(
                      //   horizontal: 20.0,
                      // ),
                      border: OutlineInputBorder(),
                      label:  Text(
                        'Password',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                      prefixIcon: (
                           Icon(
                            Icons.lock,
                            color: Theme.of(context).iconTheme.color,
                          )
                      ),
                      suffixIcon: IconButton(
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: isPassword,
                    keyboardType: TextInputType.visiblePassword,
                  ),

                 const SizedBox(
                    height: 20.0,
                  ),

              TextFormField(
                validator: (value) {
                  if ( value!= passwordController.text) {
                   return 'password must be the same.';
                    //return null;
                  }else{
                    return null ;
                  }
                },
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  // isDense: false,
                  // contentPadding: const EdgeInsets.symmetric(
                  //   horizontal: 20.0,
                  // ),
                  border: OutlineInputBorder(),
                  label:  Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                  ),
                  prefixIcon: (
                    Icon(
                      Icons.lock,
                     color: Theme.of(context).iconTheme.color,
                    )
                  ),
                  suffixIcon: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
              ),


                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    validator: (value) {
                      if ( value!.isEmpty) {
                        return 'this field must not be empty';
                      }
                      else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Number',
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                       ),
                      prefixIcon: Icon(
                        Icons.add_call,
                        color: Theme.of(context).iconTheme.color,
                      ),

                      border: OutlineInputBorder(),

                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),


                  Row(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.purple,
                        //width: 90,
                        height: 45,

                        child: MaterialButton(
                          onPressed: () async
                          {
                          if (formKey.currentState!.validate()) {
                            // firebase register
                          await FirebaseAuthentication.register(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneNumberController.text,
                               (){
                                 Navigator.pushAndRemoveUntil(
                                   context,
                                   MaterialPageRoute(
                                     builder:(context)=> ChooseScreen(),
                                   ),
                                       (route)
                                   {
                                     return false;
                                   },
                                 );
                               },
                               (message){
                                 log(message);
                                 _showMyDialog(message);
                               },
                            );

                          setState(() {
                          isClicked = true;

                          });
                          }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18.0,
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
        ),
      ),

    );
  }
  Future<void> _showMyDialog(String errMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error!'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(errMessage),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}