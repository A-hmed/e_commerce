import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/get_user_cart_response.dart';
import 'package:e_commerce/domain/repos/cart_repo/cart_repo.dart';
import 'package:e_commerce/ui/utils/SharedPrefrencesUtils.dart';
import 'package:http/http.dart';

import '../../../ui/utils/constants.dart';

class CartRepoImpl extends CartRepo {
  @override
  decreaseProductCount(String productId, int productCount) async {
    String token = (await SharedPrefsUtils.getToken())!;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoints.getProductsInCart +"/" + productId, );
      Response serverResponse = await get(url, headers: {"token": token});
      if (serverResponse.statusCode < 300 && serverResponse.statusCode >= 200) {

        GetUserCartResponse response =
            GetUserCartResponse.fromJson(jsonDecode(serverResponse.body));
        return Right(response.data!);
      } else {
        return Left(BaseError(Constants.generalErrorMessage));
      }
    } else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<BaseError, CartData>> getProductsInCart() async {
    String token = (await SharedPrefsUtils.getToken())!;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoints.getProductsInCart);
      Response serverResponse = await get(url, headers: {"token": token});
      if (serverResponse.statusCode < 300 && serverResponse.statusCode >= 200) {
        GetUserCartResponse response =
            GetUserCartResponse.fromJson(jsonDecode(serverResponse.body));
        return Right(response.data!);
      } else {
        return Left(BaseError(Constants.generalErrorMessage));
      }
    } else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

  @override
  increaseProductCount(int productCount) {
    // TODO: implement increaseProductCount
    throw UnimplementedError();
  }
}
