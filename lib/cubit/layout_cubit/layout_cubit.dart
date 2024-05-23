import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/local_db/shared_preferences.dart';
import 'package:praecoxproject/views/Profile/profilescreen.dart';
import '../../models/profile_model/profile_model.dart';
import '../../views/home_screen/home_screen.dart';
import '../../views/on_boarding/on_boarding_screen.dart';

part 'layout_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  ProfileData? profileData;

  // void getCompleteProfile(){
  //   if (CashHelper.getString(key: MyKeyCache.completeProfile) == 'true') {
  //     screens[4] = const ProfileScreen();
  //   } else {
  //     screens[4] = const CompleteProfileScreen();
  //     // screens[4] = const LoginScreen();
  //   }
  // }

  List<Widget> screens = [
    HomeScreen(),
    const OnBoardingScreen(),
    // const OnBoardingScreen(),
    const OnBoardingScreen(),
    PatientProfile(),
  ];

  List<String> labels = [
    'Home',
    'Messages',
    'Saved',
    'Profile'
    // 'Settings'
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNacBarState());
  }

  void getProfileData() async {
    emit(GetDataLoading());
    String token = await SharedPrefrenceHelper.getData(key: 'token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio
        .request(
      'https://praecox.future-developers.cloud/api/AccountPatient/show',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    )
        .then((value) {
      profileData = ProfileData.fromJson(value.data);
      print(value.data);
      emit(GetDataSuccess());
    }).catchError((e) {
      emit(GetDataError());
      print(e.statusMessage);
    });
  }
}
