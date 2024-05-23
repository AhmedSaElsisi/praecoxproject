import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import 'package:praecoxproject/local_db/shared_preferences.dart';
import '../../models/patient_register_model/patient_reg_model.dart';
import '../../models/rmi_upload_model/rmi_upload_model.dart';


class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  PatientRegisterCubit() : super(RegisterInitial());
   static PatientRegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordRegisterController   = TextEditingController();
  TextEditingController nameRegisterController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController genderRegisterController = TextEditingController();
  TextEditingController phoneRegisterController = TextEditingController();
  TextEditingController dateRegisterController = TextEditingController();
  TextEditingController ageRegisterController = TextEditingController();
  TextEditingController ssnRegisterController = TextEditingController();
  TextEditingController addressRegisterController = TextEditingController();
  PatientRegister? patientReg;
  RmiUploadModel? rmiUploadModel;
  Future register() async {
    try {
      emit(RegisterLoading());
      var response = await Dio()
          .request('https://praecox.future-developers.cloud/api/registerPatient',
              options: Options(
                method: 'POST',
              ),
              data: {
                'name': nameRegisterController.text,
                'email': emailRegisterController.text,
                'password': passwordRegisterController.text,
                'Gender': genderRegisterController.text,
                'phone': phoneRegisterController.text,
                'date': dateRegisterController.text,
                'age': ageRegisterController.text,
                'ssn': ssnRegisterController.text,
                'address': addressRegisterController.text,
          });

      if (response.statusCode == 200) {
        emit(RegisterSuccess());
        patientReg = PatientRegister.fromJson(response.data);
        print(patientReg!.token);
        SharedPrefrenceHelper.saveData(key: 'token', value:patientReg!.token );
      } else {
        emit(RegisterError('Register failed. Please check your credentials.'));
      }
    } catch (error) {
      print(error);
      emit(RegisterError(error.toString()));
    }
  }

  // Future rmiUpload({String? imagePath, String? imageName}) async {
  //   var data = FormData.fromMap({
  //     'image': [await MultipartFile.fromFile(imagePath!, filename: imageName)],
  //   });
  //   try {
  //     emit(UploadImageLoading());
  //     var response = await Dio().request(
  //         'https://praecox.future-developers.cloud/api/Diagnostic/store',
  //         options: Options(headers: {
  //           'Accept': 'application/json',
  //           'Content-Type': 'application/json',
  //           'Authorization':
  //               'Bearer mcZ5k8DdwJHlsFj7VEmCX43oZx6l0QNk95qFNb6B523772a3',
  //         }, method: 'POST'),
  //         data: data);
  //     if (response.statusCode == 200) {
  //       emit(UploadImageSuccess());
  //       print('successfully upload');
  //      // rmiUploadModel = RmiUploadModel.fromJson(response.data);
  //       // rmiUploadModel?.diagnosticStage;
  //       //  rmi =RmiUpload.fromJson(response.data);
  //     } else {}
  //   } catch (error) {
  //     emit(UploadImageError());
  //     print(error);
  //   }
  // }















  // RmiFetchModel? rmiFetchModel;
  // Future rmiFetch({String? imagePath, String? imageName}) async {
  //   var data = FormData.fromMap({
  //     // 'image': [await MultipartFile.fromFile(imagePath!, filename: imageName)],
  //   });
  //   try {
  //     emit(RmiFetchLoading() as RegisterState);
  //     var response = await Dio().request(
  //         'https://praecox.future-developers.cloud/api/Diagnostic/show',
  //         options: Options(headers: {
  //           'Accept': 'application/json',
  //           'Content-Type': 'application/json',
  //           'Authorization':
  //           'Bearer 49|nooVeLJBNn9wOFFGVigXwR1vRtEvb4J9m9wsaVGs2929b175',
  //         }, method: 'GET'),
  //         data: data);
  //     if (response.statusCode == 200) {
  //       emit(RmiFetchSuccess() as RegisterState);
  //       print('successfully upload');
  //       rmiFetchModel = RmiFetchModel.fromJson(response.data);
  //       // rmiUploadModel?.diagnosticStage;
  //       //  rmi =RmiUpload.fromJson(response.data);
  //     } else {}
  //   } catch (error) {
  //     emit(RmiFetchError as RegisterState);
  //     print(error);
  //   }
  // }


}
