import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page0.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page1.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page2.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page3.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page4.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../components.dart';

import 'StatesApp.dart';

class SoicalLoginCubits extends Cubit<SocialStates> {
  SoicalLoginCubits() : super(SoicalINitialState());

  static SoicalLoginCubits get(context) => BlocProvider.of(context);

  // @override
  // void onChange(Change<SocialStates> change) {
  //   super.onChange(change);
  //   debugPrint(change.toString());
  // }
 //late User_Register_model model;

  // function to return data of user register
void getUserData() async{
    emit(SoicalGetUserLoadingState());
    FirebaseFirestore.instance.collection('UserRegister')
        .doc(uId).get().then((value) {
         print(value.data());


        //  model = User_Register_model.fromJson(value.data());
          emit(SoicalGetUserSuccessState());
    })
        .catchError((error){
          emit(SoicalGetUserErrorState(error.toString()));
    });
}
  // Future getData() async{
  //   var collection = FirebaseFirestore.instance.collection('UserRegister');
  //   var docSnapshot = await collection.doc('uId').get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic>? data = docSnapshot.data();
  //     var value = data?['Name'];
  //     print('$value');
  //     // <-- The value you want to retrieve.
  //     // Call setState if needed.
  //   }
  // }

int CurrentIndex = 0;
  int CurrentIndex2 = 0;
  List<String> Title = [
    'page1',
    'page2',
    'page3',
    'page4',
    'page5',
  ];

List<Widget> Screens = [
  page0(),
  page1(),
  page2(),
  page3(),
  page4(),
];

void ChangeNavBarScrrens(int index){
  CurrentIndex = index;
  emit(SoicalChangeNavBarState());

}


     getUserDataIndividal() async {
    //query the user photo
        FirebaseFirestore.instance.collection("UserRegister").doc(uId).snapshots().listen((event) {
        userName = event.get("Name");
        userAge = event.get("Age");
        userPhone = event.get("PhoneNumber");
        userEmail = event.get("Email");
    });
  }


}

