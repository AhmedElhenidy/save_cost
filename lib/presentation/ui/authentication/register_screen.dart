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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Register now and discover app',
                    style:TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[600],

                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
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
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(),
                      label: const Text(
                        'Password',
                      ),
                      prefixIcon: (
                          const Icon(
                            Icons.lock,
                          )
                      ),
                      suffixIcon: IconButton(
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
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  label: const Text(
                    'Confirm Password',
                  ),
                  prefixIcon: (
                   const Icon(
                      Icons.lock,
                    )
                  ),
                  suffixIcon: IconButton(
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
                      prefixIcon: Icon(
                        Icons.add_call,
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
                        color: Colors.teal,
                        //width: 90,
                        height: 45,

                        child: MaterialButton(
                          onPressed: () async
                          {
                          if (formKey.currentState!.validate()) {
                            // firebase register
                           bool success = await FirebaseAuthentication.register(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneNumberController.text,
                            );
                           if(success){
                             Navigator.push(context, MaterialPageRoute(builder: (builder)=>ChooseScreen()));
                           }else{
                             log("error from register");
                           }
                          setState(() {
                          isClicked = true;

                          });
                          }
                          },
                          child: Text(
                            'Register',
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
        ),
      ),

    );
  }
}