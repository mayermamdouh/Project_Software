abstract class SocialStates{}
class SoicalINitialState extends SocialStates{}
class SoicalGetUserLoadingState extends SocialStates{}
class SoicalGetUserSuccessState extends SocialStates{}
class SoicalGetUserErrorState extends SocialStates{
  final String error;
  SoicalGetUserErrorState(this.error);
}

class SoicalChangeNavBarState extends SocialStates{}


