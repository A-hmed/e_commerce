import 'package:e_commerce/ui/screens/auth/login/login_states.dart';
import 'package:e_commerce/ui/screens/auth/login/login_view_model.dart';
import 'package:e_commerce/ui/screens/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/form_label.dart';

class Login extends StatelessWidget {
  static const String routeName = 'login';
  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginStates>(
      bloc:viewModel,
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset('assets/images/route_logo.png'),
                  const SizedBox(
                    height: 86,
                  ),
                  Text(
                    'Welcome Back To Route',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FormLabelWidget(
                    label: 'Email Address',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      hintText: 'enter your email address',
                      controller: viewModel.emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter email';
                        }
                        var emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'email format not valid';
                        }

                        return null;
                      },
                      type: TextInputType.emailAddress),
                  const SizedBox(
                    height: 32,
                  ),
                  FormLabelWidget(
                    label: 'Password',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    hintText: 'enter your password',
                    controller: viewModel.passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter password ';
                      }
                      if (text.length < 6) {
                        return 'Phone number should be at least 6 chrs.';
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: FormLabelWidget(label: 'Forget Password')),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  CustomButtonWidget(
                      title: 'Login',
                      onPressed: () {
                        viewModel.login();
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormLabelWidget(label: "Don't have an account ? "),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Register.routeName);
                        },
                        child: FormLabelWidget(label: 'Create Account'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
        listener: (context, state) {
      if (state is SuccessState) {
        Navigator.pop(context);
      }
      else if (state is ErrorState) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.message, style: TextStyle(color: Colors.black),),
              );
            });
      }
      else if (state is LoadingState) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  children: [
                    Text("Loading", style: TextStyle(color: Colors.black)),
                    Spacer(),
                    CircularProgressIndicator()
                  ],
                ),
              );
            });
      }
    });
  }
}
