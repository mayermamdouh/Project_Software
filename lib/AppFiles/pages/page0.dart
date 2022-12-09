import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloks/Cubit_Register.dart';
import '../../bloks/States_Register.dart';

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
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap:(){},
                              child: Column(
                                children: const [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:  NetworkImage('https://img.freepik.com/free-photo/portrait-cute-little-kid-boy-stylish-jeans-clothes-looking-camera-against-white-studio-wall-kids-fashion-concept_155003-21550.jpg?w=1800&t=st=1670161754~exp=1670162354~hmac=961c6cba2916d037d799e49b35ba048783b62f3435cf59205e1b4146566a53db',
                                    ),
                                    ),
                                  SizedBox(height: 10,),
                                  Text('mayer'),
                                ],
                              ),
                            ),
                          ),
                           Expanded(
                             child: InkWell(
                              onTap:(){},
                               child: Column(
                                 children: const [
                                   CircleAvatar(
                                     radius: 70,
                                    backgroundImage:  NetworkImage('https://img.freepik.com/free-photo/little-cute-boy-with-ginger-hair-white-t-shirt-having-fun-home-popping-eyes-with-opened-mouth_176420-15473.jpg?w=1800&t=st=1670176479~exp=1670177079~hmac=0c0ec3d3cbdc91d4fe19e26c16590fa1099cf6a5730663a6abe64ef88b327bd2',
                                  ),
                                  ),
                                   SizedBox(height: 10,),
                                   Text('mayer'),
                                 ],
                               ),
                             ),
                           ),

                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20.0,
                      );
                    },
                    itemCount: 3,
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






