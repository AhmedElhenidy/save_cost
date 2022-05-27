
import 'package:flutter/material.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import 'package:save_cost/presentation/ui/authentication/login_screen.dart';
import 'package:save_cost/shop_app/search/search_screen.dart';


class SettingScreen extends StatelessWidget
{
  var formKey=GlobalKey<FormState>();
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //if(state is Loaging)
              LinearProgressIndicator(),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: ( value) {
                  if (value!.isEmpty) {
                    return 'Name must not be empty';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  label: const Text(
                    'Name',
                  ),
                  prefixIcon: (
                      const Icon(
                        Icons.person,
                      )
                  ),

                ),
                // obscureText: isPassword,

              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: ( value) {
                  if (value!.isEmpty) {
                    return 'Email Address must not be empty';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  label: const Text(
                    'Email Address',
                  ),
                  prefixIcon: (
                      const Icon(
                        Icons.email,
                      )
                  ),

                ),
                // obscureText: isPassword,

              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: ( value) {
                  if (value!.isEmpty) {
                    return 'Phone must not be empty';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(),
                  label: const Text(
                    'Mobile Phone',
                  ),
                  prefixIcon: (
                      const Icon(
                        Icons.phone,
                      )
                  ),

                ),
                // obscureText: isPassword,

              ),
              SizedBox(
                height: 20,
              ),
              defaultButton(
                function: ()
                {
                  if(formKey.currentState!.validate())
                  {
                    print(nameController.text);
                    print(emailController.text);
                    print(phoneController.text);
                  }
                }
                , text: 'Update',),
              SizedBox(
                height: 20,
              ),
              defaultButton
                (
                function: ()
                {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>LoginScreen() ,
                    ),
                        (route)
                    {
                      return false;
                    },
                  );
                },
                text: "Logout",
              ),


            ],
          ),
        ),
      ),
    );
  }
}
