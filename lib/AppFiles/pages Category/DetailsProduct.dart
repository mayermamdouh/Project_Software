// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../login/user_model_function.dart';
// import '../pages/page3.dart';
//
// class DetailsPage extends StatelessWidget {
//
//
//   @override
//   late final UrlPhoto, ItemDescription ,ChildAgeYear;
//   DetailsPage({this.UrlPhoto,this.ItemDescription,this.ChildAgeYear});
//   final conroller = Get.put(CartController());
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Obx(
//             ()=> Padding(
//           padding: const EdgeInsets.only(top: 30),
//           child: SizedBox(
//             height: 600,
//             child: ListView.builder(
//                 itemCount: conroller.products.length,
//                 itemBuilder:(BuildContext context, int index ){
//                   return CardProductCard(
//                     conroller: conroller,
//                     product: conroller.products.keys.toList()[index],
//                     quality: conroller.products.values.toList()[index],
//                     index: index,
//                   );
//                 }
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class CardProductCard extends StatelessWidget {
//   final CartController conroller;
//   final Product product;
//   final int quality;
//   final int index;
//   const CardProductCard({Key? key, required this.conroller, required this.product, required this.quality, required this.index, }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(
//         children: [
//           Ink.image(image:NetworkImage(Product.products[index].Photo),
//             height: 150,
//             fit: BoxFit.contain,
//           ),
//           SizedBox(height: 60,),
//           Text(Product.products[index].ItemName),
//           SizedBox(height: 20,),
//           Text(Product.products[index].ItemDescription),
//           SizedBox(height: 20,),
//           Text(Product.products[index].Size),
//           SizedBox(height: 20,),
//           Text(Product.products[index].Category),
//           SizedBox(height: 20,),
//           Text(Product.products[index].ChildAgeYear),
//           SizedBox(height: 20,),
//           Text('${Product.products[index].Price}'),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(onPressed: (){
//                 // cartController.addProduct(Product.products[index]);
//                 conroller.removeProduct(product);
//               },
//                   icon: Icon(Icons.remove_circle)),
//               Text('$quality'),
//               IconButton(onPressed: (){
//                 conroller.addProduct(product);
//                 print('add add');
//               },
//                   icon: Icon(Icons.add_circle)),
//             ],
//           ),
//           SizedBox(height: 30,),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:  [
//                 Text('Total',style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//
//                 ),
//                 ),
//
//                 Text('${conroller.total}',style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//
//                 ),
//                 ),
//               ],
//             ),
//           ),
//
//
//         ],
//
//       );
//   }
// }
//
//
// class CartTotal extends StatelessWidget {
//   const CartTotal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Total',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//
//             ),),
//
//             Text('Total',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//
//             ),),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
