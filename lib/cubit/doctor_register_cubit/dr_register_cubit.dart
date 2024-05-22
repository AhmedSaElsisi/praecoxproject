import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../local_db/shared_preferences.dart';
import '../../models/doctor_register_model/doctor_reg_model.dart';
import 'dr_register_state.dart';



class DoctorRegisterCubit extends Cubit<DoctorRegisterState> {
  DoctorRegisterCubit() : super(DoctorRegisterInitial());

  static DoctorRegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController doctorNameRegisterController = TextEditingController();
  TextEditingController doctorEmailRegisterController = TextEditingController();
  TextEditingController doctorPhonedRegisterController = TextEditingController();
  TextEditingController doctorAddressRegisterController = TextEditingController();
  TextEditingController doctorDegreeRegisterController = TextEditingController();
  TextEditingController doctorPasswordRegisterController = TextEditingController();
  TextEditingController doctorPasswordConfirmationRegisterController = TextEditingController();


  DoctorRegister? doctorReg;


  Future doctorRegister() async {
    try {
      emit(DoctorRegisterLoading());
      var response = await Dio()
          .request('https://praecox.future-developers.cloud/api/registerDoctor',
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            method: 'POST',
          ),
          data: {
            'name': doctorNameRegisterController.text,
            'email':doctorEmailRegisterController.text,
            'phone':doctorPhonedRegisterController.text,
            'address':doctorAddressRegisterController.text,
            'degree':doctorDegreeRegisterController.text,
            'password':doctorPasswordRegisterController.text,
            'password_confirmation':doctorPasswordConfirmationRegisterController.text,
          }
      );

      if (response.statusCode == 200) {
        emit(DoctorRegisterSuccess());
        doctorReg = DoctorRegister.fromJson(response.data);
        SharedPrefrenceHelper.saveData(key: 'token', value: doctorReg!.token!);
        doctorNameRegisterController.clear();
        doctorEmailRegisterController.clear();
        doctorPhonedRegisterController.clear();
        doctorAddressRegisterController.clear();
        doctorDegreeRegisterController.clear();
        doctorPasswordRegisterController.clear();
        doctorPasswordConfirmationRegisterController.clear();
      } else {
        emit(DoctorRegisterError('Login failed. Please check your credentials.'));
      }
    } catch (error) {
      print(error);
      emit(DoctorRegisterError(error.toString()));
    }
  }
}