import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import '../../models/patient_register_model/patient_reg_model.dart';
import '../../models/rmi_upload_model/rmi_upload_model.dart';
import 'dart:io';



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
  late AnimationController loadingController;
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

  Future rmiUpload({String imagePath,String imageName})async{
    var data = FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(imagePath!, filename: imageName)
      ],

    });
    try{
      emit(UploadImageLoading());
      var response =await Dio().request('https://praecox.future-developers.cloud/api/Diagnostic/store',
          options: Options(
              headers: {
                'Accept':'application/json',
                'Content-Type':'application/json',
                'Authorization':'Bearer mcZ5k8DdwJHlsFj7VEmCX43oZx6l0QNk95qFNb6B523772a3'
              },
              method: 'POST'
          ),
          data: data

      );
      if(response.statusCode==200){
        emit(UploadImageSuccess());
        print('successfully upload');
        //  rmi =RmiUpload.fromJson(response.data);
      }else{
      }
    }catch(error){
      emit(UploadImageError());
      print(error);
    }
  }
}