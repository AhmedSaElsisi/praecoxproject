import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:praecoxproject/cubit/doctor_login_cubit/doctor_login_cubit.dart';
import 'package:praecoxproject/cubit/rmi_fetch_cubit/rmi_fetch_cubit.dart';
import 'package:praecoxproject/cubit/rmi_upload_cubit/rmi_upload_cubit.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/notification/notification_services.dart';
import 'package:praecoxproject/views/signup_screen/signup_screen.dart';
import 'package:sizer/sizer.dart';
import 'cubit/doctor_register_cubit/dr_register_cubit.dart';
import 'cubit/layout_cubit/layout_cubit.dart';
import 'cubit/patient_login_cubit/patient_login_cubit.dart';
import 'cubit/patient_register_cubit/patient_register_cubit.dart';
import 'local_db/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DataBaseService.initDb();
  await GetStorage.init();
  await LocalNotifications.init();
  await SharedPrefrenceHelper.init();
  //await CashHelper.init();
  runApp(const MyApp());
}

// on_boarding
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => PatientRegisterCubit()),
            BlocProvider(create: (context) => DoctorLoginCubit()),
            BlocProvider(create: (context) => DoctorRegisterCubit()),
            BlocProvider(create: (context) => RmiFetchCubit()),
            BlocProvider(create: (context) => RmiUploadCubit()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Praecox patient version',
            theme: ThemeData(
                primaryColor: AppTheme.basieColor,
                brightness: Brightness.light),
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
                primaryColor: Colors.yellow, brightness: Brightness.light),

            home:  SignUpScreen(),
            // initialRoute: AppRouters
            //     .onboardPageRoute,                 // دي عشان نشغل صفحه معينه عن طريق اب رووت
            // onGenerateRoute:
            // onGenerateRoute,                   // دي عشان نشغلت فانشكن بتعات اب رووت و لو حاطيناها لوحدها بيشغل اول صفحه في الاب روت
          ),
        );
      },
    );
  }
}
