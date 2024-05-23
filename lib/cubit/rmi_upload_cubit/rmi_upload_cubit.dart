import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/rmi_upload_cubit/rmi_upload_state.dart';
import 'package:praecoxproject/local_db/shared_preferences.dart';
import 'package:praecoxproject/models/patient_login_model/patient_log_model.dart';
import '../../models/patient_register_model/patient_reg_model.dart';
import '../../models/rmi_upload_model/rmi_upload_model.dart';

class RmiUploadCubit extends Cubit<RmiUploadState> {
  RmiUploadCubit() : super(RmiUploadInitial());
  static RmiUploadCubit get(context) => BlocProvider.of(context);
  TextEditingController rmiUploadController =TextEditingController();
  RmiUploadModel? rmiUploadModel;
  PatientRegister? patientReg;
  //RmiUpload? rmi;
  Future rmiUpload({String? imagePath, String? imageName}) async {
    String token=SharedPrefrenceHelper.getData(key: 'token');
    print(token);
    var data = FormData.fromMap({
      'image': [await MultipartFile.fromFile(imagePath!, filename: imageName)],
    });
    try {
      emit(RmiUploadLoading());
      var response = await Dio().request(
          'https://praecox.future-developers.cloud/api/Diagnostic/store',
          options: Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':'Bearer $token',
          }, method: 'POST'),
          data: data);
      if (response.statusCode == 200) {
        emit(RmiUploadSuccess());
        print('successfully upload');
        rmiUploadModel = RmiUploadModel.fromJson(response.data);
        // rmiUploadModel?.diagnosticStage;
        //  rmi =RmiUpload.fromJson(response.data);
      } else {}
    } catch (error) {
      emit(RmiUploadError as RmiUploadState);
      print(error);
    }
  }


  // Future rmiUpload({String? imagePath, String? imageName})async{
  //   try{
  //     emit(RmiUploadLoading());
  //     var response =await Dio().request('https://praecox.future-developers.cloud/api/Diagnostic/store',
  //     options: Options(
  //       headers: {
  //         'Accept':'application/json',
  //         'Content-Type':'application/json',
  //         'Authorization':'Bearer mcZ5k8DdwJHlsFj7VEmCX43oZx6l0QNk95qFNb6B523772a3'
  //       },
  //       method: 'POST'
  //     ),
  //       data: {
  //       'image':rmiUploadController,
  //       }
  //     );
  //     if(response.statusCode==200){
  //       emit(RmiUploadSuccess());
  //       return ('Image Successfully Uploaded');
  //      // rmi =RmiUpload.fromJson(response.data);
  //     }else{
  //       emit(RmiUploadError('Upload failed'));
  //     }
  //   }catch(error){
  //     print(error);
  //     emit(RmiUploadError(error.toString()));
  //   }
  // }
}
