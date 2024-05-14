import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../models/rmi_upload_model/rmi_upload_model.dart';
part 'rmi_upload_state.dart';

class RmiUploadCubit extends Cubit<RmiUploadState> {
  RmiUploadCubit() : super(RmiUploadInitial());
  TextEditingController rmiUploadController =TextEditingController();
  RmiUpload? rmi;
  
  
  Future rmiUpload()async{
    try{
      emit(RmiUploadLoading());
      var response =await Dio().request('https://praecox.future-developers.cloud/api/Diagnostic/store',
      options: Options(
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'Authorization':'Bearer mcZ5k8DdwJHlsFj7VEmCX43oZx6l0QNk95qFNb6B523772a3'
        },
        method: 'POST'
      ),
        data: {
        'image':rmiUploadController,
        }
      );
      if(response.statusCode==200){
        emit(RmiUploadSuccess());
        rmi =RmiUpload.fromJson(response.data);
      }else{
        emit(RmiUploadError('Upload failed'));
      }
    }catch(error){
      print(error);
      emit(RmiUploadError(error.toString()));
    }
  }
}
