import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_cubit.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import 'package:praecoxproject/models/patient_register_model/patient_reg_model.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/Profile/patient_edit_profile.dart';
import 'package:praecoxproject/views/Settings/settingsscreen.dart';

class PatientProfile extends StatefulWidget {
  PatientProfile({super.key, this.data});
  final String? data;

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    PatientRegister? patientReg;
    return BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
      builder: (context, index) {
        var cubit = PatientRegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: AppTheme.basieColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              icon: const Icon(
                Ionicons.chevron_back_outline,
                color: Colors.white,
              ),
            ),
            leadingWidth: 80,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 20),
                  itemProfile('Name', cubit.nameRegisterController.text,
                      CupertinoIcons.person),
                  const SizedBox(height: 10),
                  itemProfile(
                      'Email', cubit.emailRegisterController.text, CupertinoIcons.mail),
                  const SizedBox(height: 10),
                  itemProfile('Phone', cubit.phoneRegisterController.text,
                      CupertinoIcons.phone),
                  const SizedBox(height: 10),
                  itemProfile('Address', cubit.addressRegisterController.text,
                      CupertinoIcons.location),
                  const SizedBox(height: 10),
                  itemProfile('National Id', cubit.ssnRegisterController.text,
                      CupertinoIcons.number_circle),
                  const SizedBox(height: 10),
                  itemProfile('Gender', cubit.genderRegisterController.text,
                      CupertinoIcons.person),
                  const SizedBox(height: 10),
                  itemProfile('Date', cubit.dateRegisterController.text,
                      CupertinoIcons.calendar),
                  const SizedBox(height: 10),
                  itemProfile('Age', cubit.ageRegisterController.text,
                      CupertinoIcons.calendar_today),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPatientProfileScreen(cubit: cubit),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: const Color(0xFF0F62FE),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: const Color(0xFF0F62FE).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),
    );
  }
}
