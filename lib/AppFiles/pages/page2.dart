import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../login/user_model_function.dart';

class page2 extends StatelessWidget {

  page2( {Key? key}) : super(key: key);

  final conroller = Get.put(CartControllerFaveriot());
  final conrollerrr = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=>
          Scaffold(
            appBar: AppBar(
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height,
                    child: ListView.builder(
                        itemCount: conroller.products.length,
                        itemBuilder:(BuildContext context, int index ){
                          return CardProductCard(
                            conroller: conroller,
                            product: conroller.products.keys.toList()[index],
                            quality: conroller.products.values.toList()[index],
                            index: index,
                            conrollerrr: conrollerrr,
                          );
                        }
                    ),
                  ),

                ],
              ),
            ),
          ),

    );

  }
}
//
class CardProductCard extends StatelessWidget {
  final CartController conrollerrr;
  final CartControllerFaveriot conroller;
  final Product product;
  final int quality;
  final int index;
   CardProductCard({Key? key, required this.conroller, required this.conrollerrr ,required this.product, required this.quality, required this.index, }) : super(key: key);

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
              // Image.network(product.Photo,fit: BoxFit.cover,height: 150,width: double.infinity,),
              Text(product.ItemName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('\$${product.Price}',style: TextStyle(color: Colors.deepOrangeAccent),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    conroller.removeProduct(product);
                  },
                      icon: Icon(Icons.favorite,color: Colors.red,)),
                ],
              ),
            ],
          ),
        ),
      );
  }
}