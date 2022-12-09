// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'StatesCustomer.dart';
// import 'classCreate.dart';
//
// class SoicalRegisterCubits extends Cubit<SoicalCustomerStates> {
//   SoicalRegisterCubits() : super(SoicalCustomerInitialStates());
//
//   static SoicalRegisterCubits get(context) => BlocProvider.of(context);
//
//
//   String? errorRegister;
//   //function al register
//   void CustomerData({
//     required int id,
//     required String name,
//     required String image,
//     required double price,
//     required int quantity,
//     // required bool isEmailVerified,
//   }) async {
//     try {
//
//       emit(SoicalCustomerLoadingStates());
//       FirebaseAuth.instance
//           .currentUser
//           .then((value) {
//         Information_Customer_Product(
//           id:id,
//           name:name,
//           image:image,
//           price:price,
//           quantity:quantity,
//
//           // isEmailVerified: isEmailVerified,
//         );
//       }).catchError((error){
//         emit(SoicalCustomerErrorStates(error.toString()));
//       });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//         print(e.message);
//       } else if (e.code == 'email-already-in-use') {
//         print(e.message);
//       }
//       errorRegister = e.message;
//       print('$errorRegister mayer');
//     } catch (error) {
//       print(error.toString());
//
//     }
//   }
//
//
// // de function b set al data fe UserRegister collection al at create
//   //late var number ;
//   void Information_Customer_Product({
//     required int id,
//     required String name,
//     required String image,
//     required double price,
//     required int quantity,
//     // required bool isEmailVerified,
//   }) {
//
//     Information_Customer_Model model = Information_Customer_Model(
//       id: id,
//       name: name,
//       image: image,
//       price: price,
//       quantity: quantity,
//
//
//
//     );
//
//     FirebaseFirestore.instance.collection('CutomerProductInformation')
//         .doc().set(model.ToMap())
//         .then((value) {
//       emit(SoicalCustomerSuccessStates());
//       print('Customer Product added success');
//     })
//         .catchError((error){
//       print('You have error in Customer Product added success');
//       emit(SoicalCustomerErrorStates(error.toString()));
//       print(error );
//     });
//   }
//
//   // var name;
//   // Future getName() async{
//   //   FirebaseFirestore.instance
//   //       .collection('UserRegister')
//   //       .get()
//   //       .then((QuerySnapshot querySnapshot) {
//   //     querySnapshot.docs.forEach((doc) {
//   //       print(doc["Name"]);
//   //       name = doc["Name"];
//   //
//   //
//   //     });
//   //   });
//   // }
// }
//
