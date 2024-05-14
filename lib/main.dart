
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:praecoxproject/local_db/db_helper.dart';
import 'package:praecoxproject/medicants_screen/VeryMildDemented/verymilddementedscreen1.dart';
import 'package:praecoxproject/medicants_screen/VeryMildDemented/verymilddementedscreen2.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/Doctor/dr_profile.dart';
import 'package:praecoxproject/views/Profile/profilescreen.dart';
import 'package:praecoxproject/views/Settings/settingsscreen.dart';
import 'package:praecoxproject/views/Splash/splashscreen.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:praecoxproject/views/home_screen/layout_screen.dart';
import 'package:praecoxproject/views/note/note_home_screen.dart';
import 'package:praecoxproject/views/notification/notification_services.dart';
import 'package:praecoxproject/views/on_boarding/on_boarding_screen.dart';
import 'package:praecoxproject/views/signup_screen/rmi_upload.dart';
import 'package:sizer/sizer.dart';
import 'DailyCare/VeryMildCare/verymildcare.dart';
import 'cubit/layout_cubit/layout_cubit.dart';
import 'cubit/patient_login_cubit/patient_login_cubit.dart';
import 'cubit/patient_register_cubit/patient_register_cubit.dart';
import 'local_db/shared_preferences.dart';
import 'medicants_screen/MildDemented/milddementedscreen.dart';
import 'medicants_screen/ModerateDemented/moderatedementedscreen.dart';
import 'medicants_screen/EffectsTreatment/effectstreatmentscreen.dart';
import 'note2/note_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DataBaseService.initDb();
  await GetStorage.init();
  // await LocalNotifications.init();
  // await CashHelper.init();
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
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(create: (context)=> LoginCubit()),
            BlocProvider(create: (context)=> PatientRegisterCubit()),
          ],
          child:  GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Praecox patient version',
            theme: ThemeData(
              primaryColor: AppTheme.basieColor,
              brightness: Brightness.light
            ),
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              primaryColor: Colors.yellow,
              brightness: Brightness.light
            ),

            home: RmiUpload(),
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
