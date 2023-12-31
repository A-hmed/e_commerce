import 'package:e_commerce/ui/screens/auth/login/login.dart';
import 'package:e_commerce/ui/screens/auth/register/register.dart';
import 'package:e_commerce/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      routes: {
        Login.routeName: (_) => Login(),
        Register.routeName: (_)=> Register(),
      },
      initialRoute: Login.routeName,
    );
  }
}
