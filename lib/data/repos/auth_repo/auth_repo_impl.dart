import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/auth_response.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:http/http.dart';
import '../../../domain/repos/auth_repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo{

  @override
  Future<Either<BaseError, AuthResponse>> login(String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi) {

      Uri url = Uri.https(Constants.baseUrl, EndPoints.login);
      var response = await post(url, body: {"email": email, "password": password});


      var authResponse = AuthResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
       return Right(authResponse); 
      }else {
        return Left(BaseError(authResponse.message!));
      }
    }else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

  @override
  register({required String name, required String email, required String password,
    required String rePassword, required String phoneNumber}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi) {

      Uri url = Uri.https(Constants.baseUrl, EndPoints.register);
      var response = await post(url, body:
        {"email": email,
        "rePassword":rePassword,
         "phone": phoneNumber,
          "name": name,
        "password": password});
      print("Register body: ${{"email": email,
        "rePassword":rePassword,
        "phone": phoneNumber,
        "name": name,
        "password": password}}");


      var authResponse = AuthResponse.fromJson(jsonDecode(response.body));
      print("Register: Response: ${response.body}");
      if(response.statusCode >= 200 && response.statusCode < 300){
        return Right(authResponse);
      }else {
        return Left(BaseError(authResponse.error != null ? authResponse.error!.msg!
            : authResponse.message!));
      }
    }else {
      return Left(BaseError(Constants.internetErrorMessage));
    }
  }

}