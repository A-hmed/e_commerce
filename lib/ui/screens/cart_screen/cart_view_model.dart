import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/get_user_cart_response.dart';
import 'package:e_commerce/domain/repos/cart_repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/cart_repo/cart_repo_impl.dart';

class CartViewModel extends Cubit<CartViewModelStates>{
  CartViewModel():super(CartInitialState());
  CartRepo repo = CartRepoImpl();

  void getProductsList() async{
    emit(CartLoadingState());
   Either<BaseError, CartData> either = await repo.getProductsInCart();
   either.fold((e) => emit(CartErrorState(e.message)),
           (cartData) => emit(CartSuccessState(cartData)));
  }

  void increaseProductCount(String productId){
    emit(CartDialogLoadingState());
  }
  void decreaseProuectCount(String productId, int count){
    if(count == 1) return;
    emit(CartDialogLoadingState());
    repo.decreaseProductCount(productId, count);
  }

}
abstract class CartViewModelStates {}
class CartInitialState extends CartViewModelStates{}
class CartLoadingState extends CartViewModelStates{}
class CartDialogLoadingState extends CartViewModelStates{}
class CartErrorState extends CartViewModelStates{
  String message;
  CartErrorState(this.message);
}
class CartSuccessState extends CartViewModelStates{
  CartData data;
  CartSuccessState(this.data);
}
class IncrearProductCountSucessState extends CartViewModelStates{}
class DecreaseProductCountState extends CartViewModelStates{}