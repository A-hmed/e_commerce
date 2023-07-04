import 'package:e_commerce/ui/screens/auth/login/login_states.dart';
import 'package:e_commerce/ui/screens/auth/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/form_label.dart';

class Register extends StatelessWidget {
  static const String routeName = 'register';
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
        } else if (state is ErrorState) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    state.message,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              });
        } else if (state is LoadingState) {
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
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/images/route_logo.png',
              height: 71,
              width: 237,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabelWidget(label: 'Full Name'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            hintText: 'enter your full name',
                            controller: viewModel.nameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            type: TextInputType.name),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Email Address'),
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
                        FormLabelWidget(label: 'Mobile Number'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            hintText: 'enter your mobile number',
                            controller: viewModel.phoneController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter mobile number';
                              }
                              if (text.trim().length < 10) {
                                return 'Phone number should be at least 10 numbers.';
                              }
                              return null;
                            },
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password'),
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
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password Confirmation'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          hintText: 're-enter your password confirmation',
                          controller: viewModel.rePasswordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please re-enter password ';
                            }
                            if (viewModel.passwordController.text != text) {
                              return "Password doesn't match.";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        CustomButtonWidget(
                            title: 'Sign Up',
                            onPressed: () {
                              viewModel.register();
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
