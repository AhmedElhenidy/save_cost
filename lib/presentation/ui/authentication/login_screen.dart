import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_cost/domain/firebase_services/firebase_authentication.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import 'package:save_cost/presentation/components/defualt_form_field.dart';
import 'package:save_cost/presentation/ui/authentication/register_screen.dart';
import 'package:save_cost/presentation/ui/choose_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold (
      appBar: AppBar(
        elevation: 4,
        backgroundColor:Colors.green,
        title: Text (
          'Welcome to your app',
          style: TextStyle(color: Colors.white,),
        ),
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form (
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text(

                  'Login',
                  style:TextStyle(
                    fontSize: 40,
                    //color: Theme.of(context).textTheme.bodyText1?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller:emailController,
                  keyboardType:TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Email must not be empty';

                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border:OutlineInputBorder() ,

                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label:  Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                  ) ,


                ),
                // defaultFormField(
                //   controller: emailController,
                //
                //   label: 'Email',
                //   prefix: Icons.email,
                //   type: TextInputType.emailAddress,
                //   validate: (value){
                //     if (value!.isEmpty){
                //       return'Email must not be empty';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return'password is to short';
                    }

                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    //
                    // isDense: false,
                    // contentPadding: const EdgeInsets.symmetric(
                    //   horizontal: 20.0,
                    //
                    //
                    // ),
                    border: OutlineInputBorder(),

                    label:  Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
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
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                        color:  Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  obscureText: isPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),

                SizedBox(height: 20,),
                defaultButton(
                  background: Colors.green,
                  text: 'Login',
                  radius: 20,
                  function: (){
                    if(formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                      FirebaseAuthentication.signIn(emailController.text,passwordController.text).then((value){
                        log("value : : $value");
                        if(value){

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

                        }
                        else{
                          log("error in sign in");
                        }
                      });

                    }
                  },
                ),
                const SizedBox(height: 20,),

                Row(
                  children: [
                    Text(

                      'Don\'t have an account ?  ',
                      style:TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>RegisterScreen()));
                      },
                      child: Text(

                        'Register Now',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.green[500],
                        ),
                      ),)


                  ],
                ),


              ],
            ),
          ),
        ),

      ),

    );

  }
}