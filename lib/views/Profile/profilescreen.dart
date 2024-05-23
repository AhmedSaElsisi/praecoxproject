import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praecoxproject/cubit/layout_cubit/layout_cubit.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_cubit.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import 'package:praecoxproject/models/patient_register_model/patient_reg_model.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/Profile/patient_edit_profile.dart';
import 'package:praecoxproject/views/Settings/settingsscreen.dart';

class PatientProfile extends StatefulWidget {
  PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
      },
      builder: (context, index) {
        var cubit = HomeCubit.get(context);
       if(index == GetDataLoading){
         return CircularProgressIndicator();
       }else if (index == GetDataError){
         return Text('Error');
       }else{
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
                   itemProfile('Name', cubit.profileData!.data!.name!,
                       CupertinoIcons.person),
                   const SizedBox(height: 10),
                   itemProfile(
                       'Email', cubit.profileData!.data!.email!, CupertinoIcons.mail),
                   const SizedBox(height: 10),
                   itemProfile('Phone', cubit.profileData!.data!.phone!,
                       CupertinoIcons.phone),
                   const SizedBox(height: 10),
                   itemProfile('Address', cubit.profileData!.data!.address!,
                       CupertinoIcons.location),
                   const SizedBox(height: 10),
                   itemProfile('National Id', cubit.profileData!.data!.ssn!,
                       CupertinoIcons.number_circle),
                   const SizedBox(height: 10),
                   itemProfile('Gender', cubit.profileData!.data!.gender!,
                       CupertinoIcons.person),
                   const SizedBox(height: 10),
                   itemProfile('Date', cubit.profileData!.data!.date!,
                       CupertinoIcons.calendar),
                   const SizedBox(height: 10),
                   itemProfile('Age', cubit.profileData!.data!.age!.toString(),
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
                         // Navigator.push(
                         //   context,
                         //   MaterialPageRoute(
                         //     builder: (context) => EditPatientProfileScreen(cubit),
                         //   ),
                         // );
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
       }

      },

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
