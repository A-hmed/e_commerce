import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/ApiError.dart';
import 'package:e_commerce/data/model/login_response.dart';

import '../../data/model/register_response.dart';

abstract class AuthRepo{
  Future<LoginResponse> login(String email, String password);

  Future<RegisterResponse> register(String email, String password, String rePassword,
      String phoneNumber, String name);
}