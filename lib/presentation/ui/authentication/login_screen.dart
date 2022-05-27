import 'dart:developer';

import 'package:flutter/material.dart';
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
        backgroundColor:Colors.teal,
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
                SizedBox(height: 20,),
                Text(

                  'Login',
                  style:TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50,),
                defaultFormField(
                  controller: emailController,
                  label: 'Email',
                  prefix: Icons.email,
                  type: TextInputType.emailAddress,
                  validate: (value){
                    if (value!.isEmpty){
                      return'Email must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                defaultFormField(
                  controller: passwordController,
                  label: 'Password',
                  prefix: Icons.lock,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  // SuffixPressed: (){
                  //   setState(() {
                  //     isPassword=!isPassword;
                  //   });
                  // },
                  type: TextInputType.visiblePassword,

                  validate: (value){
                    if (value!.isEmpty){
                      return'password is to short';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                defaultButton(
                  text: 'Login',
                  radius: 20,
                  function: (){
                    if(formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                      FirebaseAuthentication.signIn(emailController.text,passwordController.text).then((value){
                        log("value : : $value");
                        if(value){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>ChooseScreen()));
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
                        color: Colors.black,
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
                          color: Colors.blue,
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