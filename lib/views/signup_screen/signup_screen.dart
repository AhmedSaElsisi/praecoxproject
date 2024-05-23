import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_cubit.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:praecoxproject/views/home_screen/layout_screen.dart';
import 'package:praecoxproject/views/signup_screen/rmi_upload.dart';

import '../../cubit/patient_register_cubit/patient_register_state.dart';
import '../../models/patient_register_model/patient_reg_model.dart';
import '../../style/app_colors.dart';
import '../../style/theme.dart';
import '../../widgets/custom_scaffold.dart';
import '../signin_screen/signin_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  //final Signup signup;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  PatientRegister? patientReg;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RmiUpload()));
          print('sucessfully register');
        }
      },
      builder: (context, state) {
        var cubit = PatientRegisterCubit.get(context);
        return CustomScaffold(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    // get started form
                    child: Form(
                      key: _formSignupKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // get started text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: SizedBox(
                                    height: 45,
                                    child:
                                    Image.asset('assets/images/logo.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w900,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          // full name
                          TextFormField(
                            controller: cubit.nameRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Full name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Full Name'),
                              hintText: 'Enter Full Name',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // email
                          TextFormField(
                            controller: cubit.emailRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: const Icon(
                                Icons.email,
                                color: AppTheme.basieColor,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: cubit.ageRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Age';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Age'),
                              hintText: 'Enter your Age',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // gender
                          TextFormField(
                            controller: cubit.genderRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your gender';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Gender'),
                              hintText: 'Enter your Gender',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: cubit.phoneRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Phone'),
                              hintText: 'Enter your Phone',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: const Icon(
                                Icons.phone_android,
                                color: AppTheme.basieColor,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // email
                          TextFormField(
                            controller: cubit.ssnRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your National id';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: const Text('Nation Id'),
                                hintText: 'Enter your Nation Id',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: Icon(
                                  Icons.numbers,
                                  color: AppTheme.basieColor,
                                )),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: cubit.dateRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: const Text('Date'),
                                hintText: 'Enter your Date',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(
                                  Icons.date_range,
                                  color: AppTheme.basieColor,
                                )),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            controller: cubit.addressRegisterController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: const Text('Address'),
                                hintText: 'Enter your Adress',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color:
                                    Colors.black12, // Default border color
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(
                                  Icons.location_city,
                                  color: AppTheme.basieColor,
                                )),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),

                          // password
                          TextFormField(
                            controller: cubit.passwordRegisterController,
                            // obscureText: true,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              hintText: 'Enter Password',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black12, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: AppTheme.basieColor,
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: !_isPasswordVisible,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // i agree to the processing
                          Row(
                            children: [
                              Checkbox(
                                value: agreePersonalData,
                                onChanged: (bool? value) {
                                  setState(() {
                                    agreePersonalData = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'I agree to the processing of ',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12),
                              ),
                              Text(
                                'Personal data',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          // signup button
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: Color(0xFF0F62FE),
                              ),
                              onPressed: () {
                                cubit.register();
                                if (_formSignupKey.currentState!.validate() &&
                                    agreePersonalData) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                    ),
                                  );
                                  print(cubit.nameRegisterController.text);
                                  print(cubit.addressRegisterController.text);
                                  print(cubit.phoneRegisterController.text);
                                  print(cubit.ageRegisterController.text);
                                  print(cubit.emailRegisterController.text);
                                  print(cubit.genderRegisterController.text);
                                  print(cubit.ssnRegisterController.text);
                                  print(cubit.passwordRegisterController.text);

                                } else if (!agreePersonalData) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please agree to the processing of personal data'),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                ' Next',
                                style: TextStyle(
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 25.0,
                          ),
                          // already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (e) =>  SignInScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
