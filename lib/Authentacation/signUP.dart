import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled19/Authentacation/cubit/register_cubit.dart';
import 'package:untitled19/Authentacation/cubit/register_state.dart';
import 'package:untitled19/utils/dialog.utils.dart';

import '../app-colors.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'sign';

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  RegisterCubit cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterCubit, RegisterStates>(
        bloc: cubit,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(
                context: context, loadingLabel: 'Loading...');
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                content: state.errorMessage,
                posActionName: 'ok',
                title: 'Error');
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                content: 'Register Successfully',
                posActionName: 'ok',
                title: 'Success');
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xff01366a),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/Group 5.png'),
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      'Full Name',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: cubit.nameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your full name',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Mobile Number',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: cubit.phoneController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your mobile number',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length != 11) {
                          return 'Phone number must be 11 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'E-mail Address',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: cubit.emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your Email';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: cubit.passwordController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),

                        //to make it unseen first
                        suffixIcon: IconButton(
                          icon: Icon(
                            cubit.isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              cubit.isObscure = !cubit.isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter Password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      obscureText: !cubit.isObscure,
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.register();
                        },
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(398, 64),
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
