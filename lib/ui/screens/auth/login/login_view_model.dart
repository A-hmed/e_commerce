import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/BaseError.dart';
import 'package:e_commerce/data/models/auth_response.dart';
import 'package:e_commerce/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:e_commerce/ui/screens/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repos/auth_repo/auth_repo.dart';

class LoginViewModel extends Cubit<AuthStates>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepoImpl();

  LoginViewModel(): super(AuthInitialState());


  login() async {
    if(! formKey.currentState!.validate()) return;
    emit(AuthLoadingState());
   Either<BaseError, AuthResponse> either = await
   repo.login(emailController.text, passwordController.text);

   either.fold((error) {
     emit(AuthErrorState(error.message));
   }, (response){
     emit(AuthSuccessState());
   });
  }
}