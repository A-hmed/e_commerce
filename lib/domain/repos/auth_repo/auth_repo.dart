import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/auth_response.dart';

abstract class AuthRepo {
  Future<Either<BaseError, AuthResponse>> login(String email, String password);

  Future<Either<BaseError, AuthResponse>> register({required String name,
    required String email, required String password,
    required String rePassword,
    required String phoneNumber});
}