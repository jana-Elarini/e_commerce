import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/Authentacation/cubit/register_state.dart';

import '../../data/api_manager.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'jana');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'jana5@route.com');
  var phoneController = TextEditingController(text: '01200679988');
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());
        var response = await ApiManager.register(
            emailController.text,
            nameController.text,
            phoneController.text,
            passwordController.text,
            confirmationPasswordController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
