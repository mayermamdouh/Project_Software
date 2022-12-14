

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components.dart';
import '../login/user_model_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'States_Register.dart';

class SoicalRegisterCubits extends Cubit<SoicalRegisterStates> {
  SoicalRegisterCubits() : super(SoicalRegisterInitialStates());

  static SoicalRegisterCubits get(context) => BlocProvider.of(context);

  // @override
  // void onChange(Change<SoicalRegisterStates> change) {
  //   super.onChange(change);
  //   debugPrint(change.toString());
  // }
//   IconData suffix = Icons.visibility_outlined;
// bool isPassword = true;
//   void ChangePasswordVisibilty(){
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(SoicalChangePasswordVisbility());
//   }
  String? errorRegister;
  //function al register
  void userRegister({
    required String name,
    required String phoneNumber,
    required String age,
    required String email,
    required String password,
   // required bool isEmailVerified,
  }) async {
    try {
      emit(SoicalRegisterLoadingStates());
       FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        User_Register_create(
          name:name,
          phoneNumber:phoneNumber,
          age:age,
          email:email,
          password:password,
          uId:value.user!.uid,
         // isEmailVerified: isEmailVerified,
        );
      }).catchError((error){
        emit(SoicalRegisterErrorStates(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        print(e.message);
      } else if (e.code == 'email-already-in-use') {
        print(e.message);
      }
      errorRegister = e.message;
      print('$errorRegister mayer');
    } catch (error) {
      print(error.toString());

    }
  }


// de function b set al data fe UserRegister collection al at create
  //late var number ;
  void User_Register_create({
    required String name,
    required String phoneNumber,
    required String age,
    required String email,
    required String password,
    required String uId,
   // required bool isEmailVerified,
  }) {

    User_Register_model model = User_Register_model(
      name:name,
      phoneNumber:phoneNumber,
      age:age,
      email:email,
      password: password,
      uId:uId,
     // isEmailVerified: isEmailVerified,
    );
    // number =int.parse(age);
    FirebaseFirestore.instance.collection('UserRegister')
        .doc(uId).set(model.ToMap())
        .then((value) {
          emit(SoicalCreteUserSuccessStates());
      print('Set_Redister_successed');
    })
        .catchError((error){
      print('You have error in Set Redister');
      emit(SoicalCreteUserErrorStates(error.toString()));
      print(error );
    });
  }



// var name;
// Future getName() async{
//   FirebaseFirestore.instance
//       .collection('UserRegister')
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//      querySnapshot.docs.forEach((doc) {
//       print(doc["Name"]);
//        name = doc["Name"];
//
//
//     });
//   });
// }
//
}

