import 'package:e_commerce/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:e_commerce/ui/screens/auth/login/login.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/screens/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/repos/auth_repo/auth_repo.dart';

class SplashScreen extends StatelessWidget { 
  static const routeName = "splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(
      seconds: 2),  () async{
      AuthRepo repo = AuthRepoImpl();
      bool isLoggedIn = await repo.isAuthorized();
     if(isLoggedIn){
       Navigator.pushNamed(context, HomeScreen.routeName);
     }else {
       Navigator.pushNamed(context, Login.routeName);
     }
    });
    return Scaffold(
      body: Image.asset("assets/images/splash_image.png", fit: BoxFit.fill,),
    );
  }
}
