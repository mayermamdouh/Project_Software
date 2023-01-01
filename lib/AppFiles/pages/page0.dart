import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../bloks/Cubit_Register.dart';
import '../../bloks/States_Register.dart';
import '../../components.dart';
import '../../login/user_model_function.dart';
import 'SearchPage.dart';
class page0 extends StatefulWidget {
  const page0({Key? key}) : super(key: key);

  @override
  State<page0> createState() => _page0State();
}

class _page0State extends State<page0> {
  List<String> imgesUrl = [
    'https://bestinau.com.au/wp-content/uploads/2019/08/Best-Children-Clothing-Stores-in-Canberra-1280x720.jpg',
    'https://img.freepik.com/free-photo/cute-stylish-children_155003-8330.jpg?w=2000',
    'https://wallpaperaccess.com/full/5267656.jpg',
  ];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  int _currentIndex = 0;
  final productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SoicalRegisterCubits,SoicalRegisterStates>(
      listener: ( context,  state) {  },
      builder: ( context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  const Center(
              child: Text(
                "Reuse clothes",
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Search()),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: Padding(
            padding:  EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      // enlargeCenterPage: true,
                      //scrollDirection: Axis.vertical,
                      onPageChanged: (index, reason) {
                        setState(
                              () {
                            _currentIndex = index;
                          },
                        );
                      },
                    ),
                    items: imgesUrl
                        .map(
                          (item) => Padding(
                        padding:  EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(

                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children:  const [
                                    Text(
                                      'Casual Collections',
                                      //  '${titles[_currentIndex]}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                                Align(
                                  alignment: const FractionalOffset(1, 1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: imgesUrl.map((urlOfItem) {
                                      int index = imgesUrl.indexOf(urlOfItem);
                                      return Container(
                                        width: 10.0,
                                        height: 10.0,
                                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          _currentIndex == index ? Colors.black : Colors.grey[300],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 453,
                    child: ListView.builder(
                        itemCount:productcontroller.products.length,
                        itemBuilder: (BuildContext context, int index) {

                          return  CatalogProductCard(index : index);
                        }),
                  ),

                ],
              ),
            ),
          ),
        );
      },


    );
  }


}


class CatalogProductCard extends StatelessWidget {
  CatalogProductCard({Key? key, required this.index, }) : super(key: key);
  final catcontroller = Get.put(CartController());
  final productcontroller = Get.put(ProductController());
  final catcontrollerFaveriot = Get.put(CartControllerFaveriot());

  final int index;
   bool isFavorite1 = false;

  final ValueNotifier sideMenuValue = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: (){

            },
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 210,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Image.network(productcontroller.products[index].Photo,fit: BoxFit.contain,height: 150,),
                          //height: 130,width: double.infinity,
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5,top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( productcontroller.products[index].ItemName,maxLines: 1,style: TextStyle(color: Colors.black),),
                            SizedBox(height: 2,),
                            Text(productcontroller.products[index].ItemDescription,maxLines: 3,style: TextStyle(color: Colors.black54,)),
                            SizedBox(height: 2,),
                            Text(productcontroller.products[index].Size,maxLines: 1,style: TextStyle(color: Colors.blue)),
                            SizedBox(height: 2,),
                            Text( productcontroller.products[index].Category,maxLines: 1,),
                            SizedBox(height: 2,),
                            Text(productcontroller.products[index].ChildAgeYear,maxLines: 1,),
                            SizedBox(height: 2,),
                            Text('\$${productcontroller.products[index].Price}',maxLines: 1,style: TextStyle(color: Colors.deepOrangeAccent)),
                            SizedBox(height: 2,),
                           Expanded(
                             child: Padding(
                               padding:  EdgeInsets.only(right: 10,),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 IconButton(
                                   onPressed: (){
                                   catcontroller.addProduct(productcontroller.products[index]);
                                   var snackBar = SnackBar(content: Text('Product Add To Cart'));
                                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                 }, icon: Icon(Icons.add_shopping_cart)),
                                 IconButton(
                                     onPressed: (){
                                       isFavorite1 = !isFavorite1;
                                       catcontrollerFaveriot.addProduct(productcontroller.products[index]);
                                       var snackBar = SnackBar(content: Text('Product Add To Love'));
                                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                     },
                                     icon: Icon(Icons.favorite,color: isFavorite1 ?Colors.red:Colors.black87 ,)),
                               ],),
                             ),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}






