
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_cost/domain/model/product_model.dart';
import 'package:save_cost/domain/model/user_model.dart';
import 'package:save_cost/presentation/components/default_button.dart';
import 'package:save_cost/presentation/components/themes.dart';
import 'package:save_cost/presentation/ui/authentication/login_screen.dart';
import 'package:save_cost/sharing_cost_screens/profile/profile.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:provider/provider.dart';



class SettingScreen extends StatefulWidget
{
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var formKey=GlobalKey<FormState>();

  // var nameController =TextEditingController();
  List<UserModel> users= [] ;

  List<Product> products= [] ;

  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (BuildContext context) => AppCubit(),
     child: BlocConsumer<AppCubit,AppStates >(
       listener: ( context , state ){},
       builder: ( context , state ){
        // AppCubit cubit=AppCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             elevation: 4,
             //shadowColor: ,
             title: Text('Settings'),
             actions: [
               IconButton(
                 icon: Icon(Icons.account_circle),
                 onPressed: ()
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (builder)=>Profile()));
                 },

               ),

             ],
           ),
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Form(
                 key: formKey,
                 child: Column(
                   children: [
                     //if(state is Loading)
                     //LinearProgressIndicator(),

                     // SizedBox(
                     //   height: 20,
                     // ),
                     // TextFormField(
                     //   controller: nameController,
                     //   keyboardType: TextInputType.name,
                     //   validator: ( value) {
                     //     if (value!.isEmpty) {
                     //       return 'Name must not be empty';
                     //     }
                     //
                     //     return null;
                     //   },
                     //   decoration: InputDecoration(
                     //     isDense: false,
                     //     contentPadding: const EdgeInsets.symmetric(
                     //       horizontal: 20.0,
                     //     ),
                     //     border: OutlineInputBorder(),
                     //     label: const Text(
                     //       'Name',
                     //     ),
                     //     prefixIcon: (
                     //         const Icon(
                     //           Icons.person,
                     //         )
                     //     ),
                     //
                     //   ),
                     //   // obscureText: isPassword,
                     //
                     // ),
                     // SizedBox(
                     //   height: 20,
                     // ),
                     // TextFormField(
                     //   controller: emailController,
                     //   keyboardType: TextInputType.emailAddress,
                     //   validator: ( value) {
                     //     if (value!.isEmpty) {
                     //       return 'Email Address must not be empty';
                     //     }
                     //
                     //     return null;
                     //   },
                     //   decoration: InputDecoration(
                     //     isDense: false,
                     //     contentPadding: const EdgeInsets.symmetric(
                     //       horizontal: 20.0,
                     //     ),
                     //     border: OutlineInputBorder(),
                     //     label: const Text(
                     //       'Email Address',
                     //     ),
                     //     prefixIcon: (
                     //         const Icon(
                     //           Icons.email,
                     //         )
                     //     ),
                     //
                     //   ),
                     //   // obscureText: isPassword,
                     //
                     // ),
                     // SizedBox(
                     //   height: 20,
                     // ),
                     // TextFormField(
                     //   controller: phoneController,
                     //   keyboardType: TextInputType.phone,
                     //   validator: ( value) {
                     //     if (value!.isEmpty) {
                     //       return 'Phone must not be empty';
                     //     }
                     //
                     //     return null;
                     //   },
                     //   decoration: InputDecoration(
                     //     isDense: false,
                     //     contentPadding: const EdgeInsets.symmetric(
                     //       horizontal: 20.0,
                     //     ),
                     //     border: OutlineInputBorder(),
                     //     label: const Text(
                     //       'Mobile Phone',
                     //     ),
                     //     prefixIcon: (
                     //         const Icon(
                     //           Icons.phone,
                     //         )
                     //     ),
                     //
                     //   ),
                     //   // obscureText: isPassword,
                     //
                     // ),
                     SizedBox(
                       height: 20,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Discount',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),
                         Switcher(

                           value: true,
                           size: SwitcherSize.medium,
                           switcherButtonRadius: 50,
                           enabledSwitcherButtonRotate: true,
                           iconOff:Icons.circle,
                           iconOn: Icons.circle_outlined,
                           colorOff: Colors.blueGrey.withOpacity(0.3),
                           colorOn: Colors.purple,

                           onChanged: (bool state) {
                           },
                         ),
                         // SwitcherButton(
                         //   onColor: Colors.green,
                         //   offColor: Colors.grey,
                         //   value: true,
                         //   onChange: (value) {
                         //     print(value);
                         //   },
                         // ),
                       ],
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Dark Mode',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),

                         // IconButton(onPressed: (){
                         //   AppCubit.get(context).changeAppMode();
                         // },
                         //     icon: Icon(
                         //       Icons.brightness_4_outlined,
                         //     ) ,)
                         Switcher(
                           value:AppCubit.get(context).isDark ? false: true,
                           //themeNotifier.isDarkMode? false :true,
                           size: SwitcherSize.medium,
                           switcherButtonRadius: 50,
                           enabledSwitcherButtonRotate: true,
                           iconOff:Icons.circle,
                           iconOn: Icons.dark_mode,
                           colorOff: Colors.blueGrey.withOpacity(0.3),
                           colorOn: Colors.purple,

                           onChanged: (bool state)
                           {
                             AppCubit.get(context).isDark? AppCubit.get(context).isDark=false
                             :AppCubit.get(context).isDark=true;
                             // themeNotifier.isDarkMode
                             //     ? themeNotifier.isDarkMode=false
                             //     :themeNotifier.isDarkMode=true;
                           },
                         ),
                       ],
                     ),

                     SizedBox(
                       height: 20,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Language(Arabic)',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),
                         Switcher(

                           value: false,
                           size: SwitcherSize.medium,
                           switcherButtonRadius: 50,
                           enabledSwitcherButtonRotate: true,
                           iconOff:Icons.circle,
                           iconOn: Icons.circle_outlined,
                           colorOff: Colors.blueGrey.withOpacity(0.3),
                           colorOn: Colors.purple,

                           onChanged: (bool state) {
                             //
                           },
                         ),
                       ],
                     ),

                     SizedBox(
                       height: 20,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Access Location',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),
                         Switcher(

                           value: false,
                           size: SwitcherSize.medium,
                           switcherButtonRadius: 50,
                           enabledSwitcherButtonRotate: true,
                           iconOff:Icons.circle,
                           iconOn: Icons.circle_outlined,
                           colorOff: Colors.blueGrey.withOpacity(0.3),
                           colorOn: Colors.purple,

                           onChanged: (bool state) {
                             //
                           },
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Notification',
                           style: Theme.of(context).textTheme.bodyText1,
                         ),
                         Switcher(

                           value: false,
                           size: SwitcherSize.medium,
                           switcherButtonRadius: 50,
                           enabledSwitcherButtonRotate: true,
                           iconOff:Icons.circle,
                           iconOn: Icons.circle_outlined,
                           colorOff: Colors.blueGrey.withOpacity(0.3),
                           colorOn: Colors.purple,

                           onChanged: (bool state) {
                             //
                           },
                         ),
                       ],
                     ),


                     SizedBox(
                       height: 40,
                     ),


                     defaultButton
                       (
                       background: Colors.purple[400],
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
                       radius: 20,
                       width: 120,
                     ),


                   ],
                 ),
               ),
             ),
           ),
         );
       },
     ),
   );







  }
}
