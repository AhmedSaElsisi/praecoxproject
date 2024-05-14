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
            'email': userLogInController.text,
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

  String? imagePath;
  String? imageName;
  File? file;
  PlatformFile? platformFile;
  RmiUpload? rmi;

  selectFile() async {
    final _file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (_file != null) {
      imagePath =_file.files[0].path;
      imageName =_file.files[0].name;
      file = File(_file.files.single.path!);
      platformFile = _file.files.first;
      print(file?.path);
      print(_file.files[0].name);
    }
  }

  Future rmiUpload()async{
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