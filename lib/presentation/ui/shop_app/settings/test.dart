
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:save_cost/presentation/components/themes.dart';
//
// class Test extends StatelessWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context ,ThemeModel themeModel ,child){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('test'),
//           actions: [
//            IconButton(
//                onPressed:() {
//                  themeModel.isDarkMode
//                      ?themeModel.isDarkMode=false
//                      :
//                  themeModel.isDarkMode=true;
//                },
//                icon:Icon(
//                    themeModel.isDarkMode
//                        ?Icons.wb_sunny:Icons.nightlight_rounded
//                ) ,),
//           ],
//         ),
//       );
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:save_cost/main.dart';
import 'package:save_cost/presentation/components/themes.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< AppCubit,AppStates> (
      listener: (context ,state){},
      builder: (context, state)
      {

        return  Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              //dark mode setting
              IconButton(
                onPressed: (){
                  AppCubit.get(context).changeAppMode();
                },
                icon:Icon(
                  Icons.brightness_4_outlined,
                ) ,),
            ],

          ),
          body: Center(child: Text('Hi')),
        );
      },


    );
  }
}


//class HomePage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       appBar: AppBar(
  //         iconTheme: Theme.of(context).iconTheme,
  //         backgroundColor: Colors.transparent,
  //         leading: Icon(Icons.menu),
  //         title: Text(MyApp.title),
  //         elevation: 0,
  //         actions: [
  //           ChangeThemeButtonWidget(),
  //         ],
  //       ),
  //       body: ProfileWidget(),
  //       extendBody: true,
  //       bottomNavigationBar: NavigationBarWidget(),
  //     );

  @override
  // Widget build(BuildContext context) {
  //   final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
  //       ? 'DarkTheme'
  //       : 'LightTheme';
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.orange,
  //       title: Text(MyApp.title),
  //       actions: [
  //         ChangeThemeButtonWidget(),
  //       ],
  //     ),
  //     body: Center(
  //       child: Text(
  //         'Hello $text!',
  //         style: TextStyle(
  //           fontSize: 32,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
//}




class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
