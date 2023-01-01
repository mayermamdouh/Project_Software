import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../login/user_model_function.dart';

class page3 extends StatelessWidget {

  page3( {Key? key}) : super(key: key);

   final conroller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=>
         Scaffold(
           appBar: AppBar(
           ),
           body: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Container(
                         height: 625,
                         child: ListView.builder(
                             itemCount: conroller.products.length,
                             itemBuilder:(BuildContext context, int index ){
                               return CardProductCard(
                                 conroller: conroller,
                                 product: conroller.products.keys.toList()[index],
                                 quality: conroller.products.values.toList()[index],
                                 index: index,
                               );
                             }
                         ),
                       ),
                        CartTotal(),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
    );
  }
}
//
class CardProductCard extends StatelessWidget {
  final CartController conroller;
  final Product product;
  final int quality;
  final int index;
  const CardProductCard({Key? key, required this.conroller, required this.product, required this.quality, required this.index, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Card(
           elevation: 5,
           clipBehavior: Clip.antiAlias,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(80),
             //set border radius more than 50% of height and width to make circle
           ),
           child: Column(
            children: [
              Stack(
                children: [
                  Image.network(product.Photo,fit: BoxFit.contain,height: 150,width: double.infinity,),
                ],
              ),
              Text(product.ItemName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('\$${product.Price}',style: TextStyle(color: Colors.deepOrangeAccent),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    conroller.removeProduct(product);
                    },
                      icon: Icon(Icons.remove_circle)),
                  Text('$quality'),
                  IconButton(onPressed: (){
                             // cartController.addProduct(Product.products[index]);
                             conroller.addProduct(product);
                             print('add add');
                           },
                               icon: Icon(Icons.add_circle)),
                         ],
                       ),
            ],
           ),
         ),
       );
  }
}

class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);
  final conroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Total',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              const Text(':',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),),
              Text('${double.parse('${conroller.total}')}',style: const TextStyle(
                //${conroller.total}
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}


// Future<String> downloadUrl(String ImageName)async{
//   String downloadUrl = await firebase_storage.FirebaseStorage.instance.ref('test/$ImageName').getDownloadURL();
//   return downloadUrl;
// }