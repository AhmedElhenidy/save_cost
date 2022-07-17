import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:save_cost/presentation/components/themes.dart';
import 'package:save_cost/presentation/ui/authentication/login_screen.dart';
import 'package:save_cost/presentation/ui/authentication/register_screen.dart';
import 'package:save_cost/presentation/ui/choose_screen.dart';
import 'package:save_cost/presentation/ui/product_details_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/settings/settings_screen.dart';
import 'package:save_cost/presentation/ui/shop_app/settings/test.dart';

import 'package:save_cost/presentation/ui/shopping_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/ui/on_boarding.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build (BuildContext context)
  {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create:(BuildContext context) =>AppCubit()..
   changeAppMode()),
     ],

      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder:(context ,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
            //themeModel.isDarkMode? darkTheme : lightTheme,
            ThemeData(
              iconTheme: IconThemeData(
                color:Colors.black,

              ),
              backgroundColor: Colors.grey[350],
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle:SystemUiOverlayStyle(
                  statusBarColor: Colors.grey,
                  statusBarBrightness:Brightness.dark,
                ) ,
                backgroundColor: Colors.white,
                elevation:0.0 ,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color:Colors.black,

                ) ,

              ),

              floatingActionButtonTheme:const FloatingActionButtonThemeData(
                backgroundColor: Colors.purple,
              ),
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purple,
                unselectedItemColor:Colors.grey ,
                elevation: 20.0,
                backgroundColor: Colors.white ,
              ),
              textTheme: TextTheme(
                subtitle2: TextStyle(

                  fontStyle:FontStyle.italic,

                  color: Colors.black,
                  fontSize: 30,

                ),
                bodyText2: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),

                subtitle1: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                  color: Colors.black,
                ),
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme:  ThemeData(
              colorScheme: ColorScheme.dark(background: Colors.white),
              backgroundColor: HexColor('333739'),
              iconTheme: IconThemeData(
                color:Colors.white,

              ),
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(toolbarTextStyle: TextStyle(color: Colors.green),
                titleSpacing: 20.0,
                systemOverlayStyle:SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarBrightness:Brightness.light,
                ) ,
                backgroundColor: HexColor('333739'),

                elevation:0.0 ,

                titleTextStyle:
                TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color:Colors.white,

                ) ,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.purple,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.purple,
                unselectedItemColor:Colors.grey ,
                elevation: 20.0,
                backgroundColor: HexColor('333739') ,
              ),
              textTheme: TextTheme(
                subtitle2: TextStyle(

                  fontStyle:FontStyle.italic,

                  color: Colors.white,
                  fontSize: 30,

                ),

                bodyText2: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),

                subtitle1: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                  color: Colors.white,
                ),

                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            themeMode:state is DarkModeState ? ThemeMode.dark : ThemeMode.light,
            //theme:themeModel.isDarkMode? ThemeData.dark():ThemeData.light(),

            home:
             FirebaseAuth.instance.currentUser==null?OnBoardingScreen():ChooseScreen(),
          );
        },
      ),
    );

  }
}
