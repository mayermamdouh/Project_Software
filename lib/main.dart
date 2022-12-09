import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/login/Store.dart';
import 'package:flutter_application_firebase/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AppFiles/CubitsApp.dart';
import 'AppFiles/StatesApp.dart';
import 'Bloc_observe.dart';
import 'bloks/CacheHelper.dart';
import 'bloks/Cubit_Register.dart';
import 'components.dart';

void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();


  Widget widget;
  uId = CacheHelper.getData(key: 'uId');
  if (uId != null){
    widget = const Store_page();
  }else{
    widget = const login_page();
  }
  runApp(MyApp(startWidget:widget ,));

}
class MyApp extends StatelessWidget {
  final Widget startWidget;
   MyApp({
     required this.startWidget
  });

  @override
   Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers:  [
        BlocProvider(
          create: (BuildContext context) =>SoicalLoginCubits()..getUserData() ,
        ),
        BlocProvider(
          create: (BuildContext context) =>SoicalRegisterCubits() ,//..getName()
        ),
       ],
      child: BlocConsumer<SoicalLoginCubits, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return  MaterialApp(
            theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              color: Colors.white,

            ),
              // bottomNavigationBarTheme: BottomNavigationBarThemeData(
              //   type: BottomNavigationBarType.fixed,
              //   selectedItemColor: Colors.deepOrange,
              //   selectedIconTheme: IconThemeData(color: Colors.black),
              //   elevation: 20.0,
              // ),

            ),
            debugShowCheckedModeBanner: false,
            home:startWidget ,
          );
        },
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await CacheHelper.init();
//
//   Widget widget;
//
//    uId = CacheHelper.getData(key: 'uId');
//   if (uId != null){
//     widget = const Store_page();
//   }else{
//     widget = const login_page();
//   }
//   runApp(MyApp(startWidget:widget));
// }
//
// // StatelessWidget
// // StatefulWidget
//
// class MyApp extends StatelessWidget {
//   final Widget startWidget;
//   const MyApp({super.key,
//     required this.startWidget
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (BuildContext context) => CubitsApp() ,
//         ),
//       ],
//       child: BlocConsumer<CubitsApp, StatesApp>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: startWidget,
//           );
//         },
//       ),
//     );
//   }
// }
