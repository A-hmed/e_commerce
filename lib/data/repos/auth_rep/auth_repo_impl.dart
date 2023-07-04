import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/ApiError.dart';
import 'package:e_commerce/data/model/login_response.dart';
import 'package:e_commerce/domain/repos/auth_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:http/http.dart';

import '../../model/register_response.dart';

class AuthRepoImpl extends AuthRepo{

  @override
  Future<LoginResponse> login(String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi){
      Uri url = Uri.https(Constants.baseUrl, "api/v1/auth/signin");

      Response response = await post(url, body: {"email": email, "password": password});
      LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return loginResponse;
      }else {
        return loginResponse;
      }
    }else{
      return
          LoginResponse(message: Constants.internetErrorMessage);
    }
  }

  Future<RegisterResponse> register(String email, String password, String rePassword,
        String phoneNumber, String name) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi){
      Uri url = Uri.https(Constants.baseUrl, "api/v1/auth/signup");

      Response response = await post(url,
          body: {"email": email,
              "password": password,
            "name": name,
            "rePassword": rePassword,
            "phone": phoneNumber,});
      RegisterResponse registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return registerResponse;
      }else {
        return registerResponse;
      }
    }else{
      return
        RegisterResponse(message: Constants.internetErrorMessage);
    }

  }
}