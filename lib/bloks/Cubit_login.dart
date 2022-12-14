import 'package:firebase_auth/firebase_auth.dart';
import 'Setstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoicalLoginCubits extends Cubit<SoicalLoginStates> {
  SoicalLoginCubits() : super(SoicalLoginInitialStates());

  static SoicalLoginCubits get(context) => BlocProvider.of(context);

//   IconData suffix = Icons.visibility_outlined;
// bool isPassword = true;
//   void ChangePasswordVisibilty(){
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(SoicalChangePasswordVisbility());
//   }

  void userLogin({
    required String Email,
    required String Password,
  }) async {
    try {
      emit(SoicalLoginLoadingStates());
       FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: Email,
        password: Password,
      )
          .then((value) {
        emit(SoicalLoginSuccessStates(value.user!.uid));
      }).catchError((error) {
        print(error.toString());
        emit(SoicalLoginErrorStates(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
//   FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: Email, password: Password)
//       .then((value) {
//     print(value.user!.email);
//     print(value.user!.uid);
//   }).catchError((error) {
//     print('Error to get Email and Password in userRegister');
//     print(error.toString());
//   });
  }

}

