abstract class ShopLoginStates {}

class ShopLoginInitialStateCubit extends ShopLoginStates{}

class ShopLoginLoadingStateCubit extends ShopLoginStates{}

class ShopLoginSuccessStateCubit extends ShopLoginStates{}

class ShopLoginErrorStateCubit extends ShopLoginStates
{
  final String error;

  ShopLoginErrorStateCubit(this.error);
}

