import 'package:e_commerce/data/model/login_response.dart';
import 'package:e_commerce/data/repos/auth_rep/auth_repo_impl.dart';
import 'package:e_commerce/ui/screens/auth/login/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repos/auth_repo.dart';

class LoginViewModel extends Cubit<LoginStates> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepoImpl();
  LoginViewModel(): super(InitialState());

  void login() async{
    if(!formKey.currentState!.validate()) return;
    emit(LoadingState());
     LoginResponse response = await repo.login(emailController.text, passwordController.text);
     if(response.statusMsg != null){
       emit(ErrorState(response.message!));
     }else {
       emit(SuccessState());
     }
  }

}