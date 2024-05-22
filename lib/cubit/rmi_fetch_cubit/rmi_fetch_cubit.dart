import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/rmi_fetch_cubit/rmi_fetch_state.dart';

import '../../models/rmi_upload_model/rmi_fetch_model.dart';


class RmiFetchCubit extends Cubit<RmiFetchState> {
  RmiFetchCubit() : super(RmiFetchInitial());
  static RmiFetchCubit get(context) => BlocProvider.of(context);
  RmiFetchModel? rmiFetchModel;
  Future rmiUpload({String? imagePath, String? imageName, String? stage,String? date, String? description }) async {
    var data = FormData.fromMap({
      'image': [await MultipartFile.fromFile(imagePath!, filename: imageName)],
      'Diagnostic_stage': [await MultipartFile.fromFile(stage!)],
      'Date_Diagnosis': [await MultipartFile.fromFile(date!)],
      'Description_Diagnosis': [await MultipartFile.fromFile(description!)],
    });
    try {
      emit(RmiFetchLoading());
      var response = await Dio().request(
          'https://praecox.future-developers.cloud/api/Diagnostic/show',
          options: Options(headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':
            'Bearer 49|nooVeLJBNn9wOFFGVigXwR1vRtEvb4J9m9wsaVGs2929b175',
          }, method: 'GET'),
          data: data);
      if (response.statusCode == 200) {
        emit(RmiFetchSuccess());
        print('successfully Fetch');
        rmiFetchModel = RmiFetchModel.fromJson(response.data);
        // rmiUploadModel?.diagnosticStage;
        //  rmi =RmiUpload.fromJson(response.data);
      } else {}
    } catch (error) {
      emit(RmiFetchError as RmiFetchState);
      print(error);
    }
  }
}
