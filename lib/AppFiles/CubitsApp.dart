import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page0.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page1.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page2.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page3.dart';
import 'package:flutter_application_firebase/AppFiles/pages/page4.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../components.dart';
import '../login/user_model_function.dart';
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
void getUserData(){
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


}

