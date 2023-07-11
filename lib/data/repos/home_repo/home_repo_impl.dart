import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/categories_response.dart';
import 'package:e_commerce/data/models/products_response.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/SharedPrefrencesUtils.dart';
import 'package:http/http.dart';
import '../../../ui/utils/constants.dart';
import '../../models/add_to_cart_response.dart';

class HomeRepoImpl extends HomeRepo{

  @override
  Future<Either<BaseError, List<ProductDM>>> getAllProducts() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi) {


      Uri url = Uri.https(Constants.baseUrl, EndPoints.getAllProducts);
      Response response = await get(url);

      var productsResponse = ProductsResponse.fromJson(jsonDecode(response.body));
      if(productsResponse.data != null && productsResponse.data!.isNotEmpty){
        return Right(productsResponse.data!);

      }else {
        return  Left(BaseError(Constants.generalErrorMessage));
      }
    }
    else {
      return  Left(BaseError(Constants.internetErrorMessage));
    }
    }

  @override
  Future<Either<BaseError, List<CategoryDM>>> getCategories()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoints.getCategories);
      var response = await get(url);
      var categoriesResponse = CategoriesResponse.fromJson(jsonDecode(response.body));
      if( categoriesResponse.data != null && categoriesResponse.data!.isNotEmpty){
        return Right(categoriesResponse.data!);
      }else {
        return Left(BaseError(Constants.generalErrorMessage));
      }
    }else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<BaseError, AddToCartResponse>> addToCart(String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi) {
      String token = (await SharedPrefsUtils.getToken())!;
      Uri url = Uri.https(Constants.baseUrl, EndPoints.addProductToCart);
      Response serverResponse = await post(url, body: {
        "productId":productId
      },headers: {
        "token": token
      });
      AddToCartResponse addProductToCartResponse =
      AddToCartResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode < 300 && serverResponse.statusCode >= 200){
        return Right(addProductToCartResponse);
      }else if(serverResponse.statusCode == 401){
        return Left(ExpiredTokenError(addProductToCartResponse.message!));
      }else {
        return Left(BaseError(addProductToCartResponse.message!));
      }
    }else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

}