import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloks/Cubit_Register.dart';
import '../../bloks/States_Register.dart';
import '../pages Category/T-Shirt_Category.dart';

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
  //
  // final List<String> titles = [
  //   ' Casual Collections',
  // ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SoicalRegisterCubits,SoicalRegisterStates>(
      listener: ( context,  state) {  },
      builder: ( context, state) {
        return Scaffold(
          body: Padding(
            padding:  const EdgeInsets.all(5.0),
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
                  // ListView.separated(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   itemBuilder: (context, index) {
                  //     return Row(
                  //       children: [
                  //         Expanded(
                  //           child: InkWell(
                  //             onTap:(){},
                  //             child: Card(
                  //
                  //               elevation: 10,
                  //               clipBehavior:Clip.antiAlias ,
                  //               shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10.0),
                  //               ),
                  //
                  //               child: Stack(
                  //                 alignment: Alignment.center,
                  //                 children: [
                  //                   Ink.image(image: NetworkImage('https://rose-kids.com/wp-content/uploads/elementor/thumbs/Boys-1-scaled-pftcew592jorrc9r1gwt00u6wq9rfjo55fgh9gaubc.jpg'),
                  //                   fit: BoxFit.cover,
                  //                     height: 200,
                  //                   ),
                  //                   const Text(
                  //                     'T-shirt',
                  //                     style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                       fontSize: 24,
                  //
                  //                   ),
                  //                   ),
                  //                   // Positioned(
                  //                   //   bottom:20,
                  //                   //   right:20,
                  //                   //   left:20,
                  //                   //   child: Text(
                  //                   //     'T_Sherit',
                  //                   //     style: TextStyle(
                  //                   //       fontWeight: FontWeight.bold,
                  //                   //       color: Colors.white,
                  //                   //       fontSize: 24,
                  //                   //
                  //                   //     ),
                  //                   //   ),
                  //                   // ),
                  //                 ],
                  //               ),
                  //             ),
                  //
                  //             ),
                  //           ),
                  //
                  //       ],
                  //     );
                  //   },
                  //   separatorBuilder: (context, index) {
                  //     return const SizedBox(
                  //       height: 10.0,
                  //     );
                  //   },
                  //   itemCount: 3,
                  // ),
                Row(
                  children: [
                 Expanded(
                  child: InkWell(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>T_ShirtPage()));
                    },
                    child: Card(

                      elevation: 10,
                      clipBehavior:Clip.antiAlias ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Ink.image(image: NetworkImage('https://rose-kids.com/wp-content/uploads/elementor/thumbs/Boys-1-scaled-pftcew592jorrc9r1gwt00u6wq9rfjo55fgh9gaubc.jpg'),
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                          const Text(
                            'T-shirt',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24,

                            ),
                          ),
                          // Positioned(
                          //   bottom:20,
                          //   right:20,
                          //   left:20,
                          //   child: Text(
                          //     'T_Sherit',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.white,
                          //       fontSize: 24,
                          //
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),

                  ),
                ),

              ],
            ),

                ],
              ),
            ),
            // ListView.builder(
            //     itemBuilder:
            // ),
          ),
        );
      },


    );
  }
}






