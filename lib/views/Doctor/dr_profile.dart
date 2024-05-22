
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:praecoxproject/cubit/doctor_register_cubit/dr_register_state.dart';
import 'package:praecoxproject/style/app_colors.dart';
import '../../cubit/doctor_register_cubit/dr_register_cubit.dart';
import 'doctor_home_Screen.dart';
import 'dr_edit_profle.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final ImagePicker _picker = ImagePicker();
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _profileImagePath = prefs.getString('profile_image');
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', image.path);
      setState(() {
        _profileImagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorRegisterCubit, DoctorRegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DoctorRegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: AppTheme.basieColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
                );
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
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: _profileImagePath != null
                          ? FileImage(File(_profileImagePath!))
                          : AssetImage('') as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 20),
                  itemProfile('Name', cubit.doctorNameRegisterController.text, CupertinoIcons.person),
                  const SizedBox(height: 10),
                  itemProfile('Email', cubit.doctorEmailRegisterController.text, CupertinoIcons.mail),
                  const SizedBox(height: 10),
                  itemProfile('Phone', cubit.doctorPhonedRegisterController.text, CupertinoIcons.phone),
                  const SizedBox(height: 10),
                  itemProfile('Degree', cubit.doctorDegreeRegisterController.text, CupertinoIcons.number),
                  const SizedBox(height: 10),
                  itemProfile('Address', cubit.doctorAddressRegisterController.text, CupertinoIcons.location_circle),
                  const SizedBox(height: 10),
                  itemProfile('Gender', 'others', CupertinoIcons.person),
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
                            builder: (context) =>  EditProfileScreen(cubit: cubit,),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
