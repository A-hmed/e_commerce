import 'package:e_commerce/data/model/register_response.dart';
import 'package:e_commerce/data/repos/auth_rep/auth_repo_impl.dart';
import 'package:e_commerce/domain/repos/auth_repo.dart';
import 'package:e_commerce/ui/screens/auth/login/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<LoginStates>{
  RegisterViewModel(): super(InitialState());
  
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepoImpl();
  void register() async{
    if(!formKey.currentState!.validate()) return;
    emit(LoadingState());
    RegisterResponse response = await repo.register(emailController.text,
        passwordController.text, rePasswordController.text, phoneController.text,
        nameController.text);
    
    if(response.errors != null){
      emit(ErrorState(response.errors!.msg!));
    }else if(response.statusMsg != null){
      emit(ErrorState(response.message!));
    }else{
      emit(SuccessState());
    }
    
  }
  
}