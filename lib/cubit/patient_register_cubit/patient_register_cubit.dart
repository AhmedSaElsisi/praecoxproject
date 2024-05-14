import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import '../../models/patient_register_model/patient_reg_model.dart';



class PatientRegisterCubit extends Cubit<RegisterState> {
  PatientRegisterCubit() : super(RegisterInitial());

  static PatientRegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController nameRegisterController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController genderRegisterController = TextEditingController();
  TextEditingController phoneRegisterController = TextEditingController();
  TextEditingController dateRegisterController = TextEditingController();
  TextEditingController ageRegisterController = TextEditingController();
  TextEditingController ssnRegisterController = TextEditingController();
  TextEditingController addressRegisterController = TextEditingController();
  PateintRegister? patientReg;


  Future register() async {
    try {
      emit(RegisterLoading());
      var response = await Dio()
          .request('https://praecox.future-developers.cloud/api/registerPatient',
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            method: 'POST',
          ),
          data: {
            'name': nameRegisterController.text,
            'password': passwordRegisterController.text,
            'email':emailRegisterController.text,
            'Gender':genderRegisterController.text,
            'phone':phoneRegisterController.text,
            'date':dateRegisterController.text,
            "age":ageRegisterController.text,
            "address":addressRegisterController.text,
            'ssn':ssnRegisterController.text,
          }
      );

      if (response.statusCode == 200) {
        emit(RegisterSuccess());
        patientReg = PateintRegister.fromJson(response.data);
      } else {
        emit(RegisterError('Login failed. Please check your credentials.'));
      }
    } catch (error) {
      print(error);
      emit(RegisterError(error.toString()));
    }
  }
}