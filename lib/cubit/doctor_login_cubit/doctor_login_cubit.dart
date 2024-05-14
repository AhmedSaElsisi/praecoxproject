import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/doctor_login_model/doctor_log_model.dart';
part 'doctor_login_state.dart';

class DoctorLoginCubit extends Cubit<DoctorLoginState> {
  DoctorLoginCubit() : super(DoctorLoginInitial());

  static DoctorLoginCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordDoctorLogInController = TextEditingController();
  TextEditingController userDoctorLogInController = TextEditingController();
  DoctorLogin? doctorLog;


  Future doctorLogin() async {
    try {
      emit(DoctorLoginLoading());
      var response = await Dio()
          .request('https://praecox.future-developers.cloud/api/loginDoctor',
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            method: 'POST',
          ),
          data: {
            'email': userDoctorLogInController.text,
            'password': passwordDoctorLogInController.text,
          }
      );

      if (response.statusCode == 200) {
        emit(DoctorLoginSuccess());
        doctorLog = DoctorLogin.fromJson(response.data);
      } else {
        emit(DoctorLoginError('Login failed. Please check your credentials.'));
      }
    } catch (error) {
      print(error);
      emit(DoctorLoginError(error.toString()));
    }
  }
}