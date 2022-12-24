import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components.dart';

class T_ShirtPage extends StatefulWidget {
  const T_ShirtPage({Key? key}) : super(key: key);

  @override
  State<T_ShirtPage> createState() => _T_ShirtPageState();
}


class _T_ShirtPageState extends State<T_ShirtPage> {
 bool isFavorite1 = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:<Widget> [
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height,
            child: Column(

              children:<Widget> [
                BuildCard(
                  ItemName: 'dasd',
                    ItemDescription: 'sadasda asddasnd jd bbuas dsavva vvkgv sagvk asvkdgvgas vgvk',
                    ChildAgeMonth: 'asdsa',
                    ChildAgeYear: 'dsad',
                    Size: '16',
                    Category_cat: 'T_shirt',
                    UrlPhoto: 'https://img.freepik.com/free-photo/cute-stylish-children_155003-8330.jpg?w=2000',
                    AddToCart: true,


                ),

              ],
            ),


          ),
        ],
      ),


    );
  }

  Widget BuildCard({
    required String ItemName,
    required String ItemDescription,
    required String ChildAgeMonth,
    required String ChildAgeYear,
    required String Size,
    required String Category_cat,
    required String UrlPhoto,
    required bool AddToCart,

  })=>
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                Ink.image(image:NetworkImage(UrlPhoto),
                  height: 150,
                  fit: BoxFit.cover,
                 child: InkWell(
                  onTap: (){},

                ),
                ),
                  Text(
                      ItemName,
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                       color: Colors.black,
                       fontSize: 14.0)),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                ItemDescription,
                maxLines: 2,
                style: const TextStyle(
                  color: Color(0xFFCC8053),
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 3,),
              Text(
                  ChildAgeYear,
                  style: const TextStyle(
                  color: Color(0xFFCC8053),
                  fontSize: 14.0)
              ),
              SizedBox(height: 3,),
              Text(
                  Size,
                  style: const TextStyle(
                  color: Color(0xFFCC8053),
                  fontSize: 14.0)
              ),
              SizedBox(height: 3,),
              Text(
                  Category_cat,
                  style: const TextStyle(
                  color: Color(0xFFCC8053),
                  fontSize: 14.0)
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_checkout,color: Colors.blue,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.blue,)),
                ],
              ),


            ],
          ),
        ),
      );
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     height: 180,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(15),
      //
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.grey.withOpacity(0.2),
      //           spreadRadius: 2.0,
      //           blurRadius: 2.0,
      //         ),
      //       ],
      //     ),
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding:  const EdgeInsets.only(top: 20,left: 10),
      //           child: Row(
      //             children: [
      //               Container(
      //                   height: 110.0,
      //                   width: 110.0,
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image: NetworkImage(UrlPhoto),
      //                       fit: BoxFit.cover,
      //                     ),)
      //               ),
      //               SizedBox(width: 10,),
      //               Column(
      //                 children: [
      //                 Container(
      //                   color: Colors.black38,
      //                 height:140,
      //                 width: 1,
      //                 )
      //               ],
      //               ),
      //               SizedBox(width: 10,),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     ItemName,
      //                     style: const TextStyle(
      //                         color: Color(0xFFCC8053),
      //
      //                         fontSize: 14.0)),
      //                   Text(
      //                     ItemDescription,
      //                     maxLines: 2,
      //                     style: const TextStyle(
      //                         color: Color(0xFFCC8053),
      //                         fontSize: 14.0,
      //
      //                     )
      //                 ),
      //                   Text(
      //                       ChildAgeYear,
      //                       style: const TextStyle(
      //                           color: Color(0xFFCC8053),
      //                           fontSize: 14.0)
      //                   ),
      //                   Text(
      //                       Size,
      //                       style: const TextStyle(
      //                           color: Color(0xFFCC8053),
      //                           fontSize: 14.0)
      //                   ),
      //                   Text(
      //                       Category_cat,
      //                       style: const TextStyle(
      //                           color: Color(0xFFCC8053),
      //                           fontSize: 14.0)
      //                   ),
      //                   SizedBox(height: 2,),
      //
      //                  ],
      //
      //               ),
      //
      //
      //             ],
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //
      //   ),
      // );


}
