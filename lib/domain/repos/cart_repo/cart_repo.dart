import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/get_user_cart_response.dart';

abstract class CartRepo{

  Future<Either<BaseError, CartData>>getProductsInCart();
  increaseProductCount(int productCount);
  decreaseProductCount(String product,int productCount);
}