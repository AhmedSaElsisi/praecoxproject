import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/patient_register_cubit/patient_register_cubit.dart';
import '../../cubit/patient_register_cubit/patient_register_state.dart';

class EditPatientProfileScreen extends StatefulWidget {
  final PatientRegisterCubit cubit;

  const EditPatientProfileScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  State<EditPatientProfileScreen> createState() => _EditPatientProfileScreenState();
}

class _EditPatientProfileScreenState extends State<EditPatientProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.cubit,
        child: BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
        listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
    var cubit = widget.cubit;

    return Scaffold(
    appBar: AppBar(
    elevation: 0,
    title: const Text(
    'Edit Profile',
    style:
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
      backgroundColor: Colors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
        ),
      ),
      leadingWidth: 80,
    ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 20),
                buildTextField('Name', cubit.nameRegisterController),
                const SizedBox(height: 10),
                buildTextField('Email', cubit.emailRegisterController),
                const SizedBox(height: 10),
                buildTextField('Phone', cubit.phoneRegisterController),
                const SizedBox(height: 10),
                buildTextField('Address', cubit.addressRegisterController),
                const SizedBox(height: 10),
                buildTextField('National Id', cubit.ssnRegisterController),
                const SizedBox(height: 10),
                buildTextField('Gender', cubit.genderRegisterController),
                const SizedBox(height: 10),
                buildTextField('Date', cubit.dateRegisterController),
                const SizedBox(height: 10),
                buildTextField('Age', cubit.ageRegisterController),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save changes
                        // You can also call cubit methods to save the changes to the backend
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: const Color(0xFF0F62FE),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    },
        ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}

