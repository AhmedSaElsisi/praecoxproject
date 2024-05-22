import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_login_cubit/patient_login_state.dart';
import '../../models/patient_login_model/patient_log_model.dart';
import '../../models/rmi_upload_model/rmi_upload_model.dart';
import 'dart:io';



class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordLogInController = TextEditingController();
  TextEditingController userLogInController = TextEditingController();
  PatientLogin? patientLog;


  Future login() async {
    try {
      emit(LoginLoading());
      var response = await Dio()
          .request('https://praecox.future-developers.cloud/api/loginPatient',
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            method: 'POST',
          ),
          data: {
            'email': userLogInController.text ,
            'password': passwordLogInController.text,
          }
      );

      if (response.statusCode == 200) {
        emit(LoginSuccess());
        patientLog = PatientLogin.fromJson(response.data);
      } else {
        emit(LoginError('Login failed. Please check your credentials.'));
      }
    } catch (error) {
      print(error);
      emit(LoginError(error.toString()));
    }
  }


}