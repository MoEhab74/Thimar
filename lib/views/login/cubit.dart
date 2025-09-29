import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/login/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      emit(LoadingLoginState());
      var response = await Dio().post(
        'https://thimar.amr.aait-d.com/api/login',
        data: {
          'phone': mobileController.text,
          'password': passwordController.text,
          'device_token': 'test',
          'type': 'ios',
          'user_type': 'client',
        },
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == true) {
          emit(SuccessLoginState(data['message'] ?? 'تم تسجيل الدخول بنجاح'));
        } else {
          emit(ErrorLoginState(data['message'] ?? 'فشل تسجيل الدخول'));
        }
      } else {
        emit(ErrorLoginState('فشل تسجيل الدخول'));
      }
    } on DioException catch (e) {
      emit(ErrorLoginState('حدث خطأ: ${e.message}'));
    }
  }
}
