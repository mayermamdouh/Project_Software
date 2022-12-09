abstract class SoicalLoginStates {}

class SoicalLoginInitialStates extends SoicalLoginStates {}

class SoicalLoginLoadingStates extends SoicalLoginStates {}

class SoicalLoginSuccessStates extends SoicalLoginStates {
  final String uId;
  SoicalLoginSuccessStates(this.uId);
}



class SoicalLoginErrorStates extends SoicalLoginStates {
  final String error;
  SoicalLoginErrorStates(this.error);
}

class SoicalChangePasswordVisbility extends SoicalLoginStates {}

// class  SoicalCrateUserSuccessState extends SoicalRegisterStates {}
//
// class SoicalCrateUserErrorState extends SoicalRegisterStates {
//   final String error;
//   SoicalCrateUserErrorState(this.error);
// }


