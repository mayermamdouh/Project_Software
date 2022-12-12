import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AppFiles/CubitsApp.dart';
import '../AppFiles/StatesApp.dart';


class Store_page extends StatefulWidget {
  const Store_page({super.key});

  @override
  State<Store_page> createState() => _Store_pageState();
}

class _Store_pageState extends State<Store_page> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoicalLoginCubits,SocialStates>(
      listener: (context,  state) {},

      builder: (BuildContext context, state) {
        var CubitFile = SoicalLoginCubits.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(CubitFile.Title[CubitFile.CurrentIndex]) ,
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //       bottomRight: Radius.circular(20),
            //       bottomLeft: Radius.circular(20)),
            // ),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search_sharp)),
            ],

          ),
          body: CubitFile.Screens[CubitFile.CurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: CubitFile.CurrentIndex,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,

            onTap: (index){
              CubitFile.ChangeNavBarScrrens(index);
            },

            items: const [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: ''),
              BottomNavigationBarItem(icon:Icon(Icons.camera_alt_outlined),label: ''),
              BottomNavigationBarItem(icon:Icon(Icons.favorite),label: ''),
              BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_outlined),label: ''),
              BottomNavigationBarItem(icon:Icon(Icons.person),label: ''),
            ],

          ),
        );
    },
    );
  }
}
