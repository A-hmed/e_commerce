import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/add_to_cart_response.dart';
import 'package:e_commerce/data/models/categories_response.dart';
import 'package:e_commerce/data/models/products_response.dart';


abstract class HomeRepo{
  Future<Either<BaseError, List<CategoryDM>>> getCategories();
  Future<Either<BaseError, List<ProductDM>>> getAllProducts();
  Future<Either<BaseError, AddToCartResponse>> addToCart(String productId);
}