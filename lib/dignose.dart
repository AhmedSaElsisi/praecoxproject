import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_cubit.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import 'package:praecoxproject/cubit/rmi_fetch_cubit/rmi_fetch_state.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import 'package:praecoxproject/views/home_screen/layout_screen.dart';
import 'package:praecoxproject/views/signup_screen/rmi_upload.dart';

import 'cubit/rmi_fetch_cubit/rmi_fetch_cubit.dart';
import 'cubit/rmi_fetch_cubit/rmi_fetch_cubit.dart';
import 'cubit/rmi_upload_cubit/rmi_upload_cubit.dart';
import 'cubit/rmi_upload_cubit/rmi_upload_state.dart';

class ShowDignose extends StatefulWidget {
  const ShowDignose({super.key });


  @override
  State<ShowDignose> createState() => _ShowDignoseState();
}

class _ShowDignoseState extends State<ShowDignose> {
  RmiUpload? rmi;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RmiUploadCubit, RmiUploadState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =RmiUploadCubit.get(context);
        return Scaffold(
          backgroundColor: AppTheme.basieColor,
          appBar: AppBar(
            backgroundColor: AppTheme.basieColor,
            title: const Align(
              alignment: Alignment.center,
                child: Text('Diagnose Result!',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white
                ),)),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Stage is :',style: TextStyle(
                          fontSize: 22
                      ),),
                      Text( cubit.rmiUploadModel!.diagnosticStage!,style: const TextStyle(
                          fontSize: 20
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                      child: Image.network(cubit.rmiUploadModel!.image!)),
                  const SizedBox(height: 25,),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(cubit.rmiUploadModel!.descriptionDiagnosis!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight:FontWeight.bold
                      ),),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(width: 170,
                    child: ElevatedButton(
                       style:  ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Color(0xFF0F62FE),
                        ),
                        onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    }, child: Text('Go to home',style: TextStyle(
                      color: AppTheme.white
                    ),)),
                  )
              
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
