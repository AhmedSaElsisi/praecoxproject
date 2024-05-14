import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/patient_login_cubit/patient_login_cubit.dart';
import 'package:praecoxproject/cubit/patient_login_cubit/patient_login_state.dart';
import 'package:praecoxproject/style/app_colors.dart';

import '../../widgets/custom_upload_container.dart';
import '../../widgets/widget.dart';

class RmiUpload extends StatefulWidget {
  const RmiUpload({super.key});
  @override
  _RmiUploadState createState() => _RmiUploadState();

}

class _RmiUploadState extends State<RmiUpload>
    with SingleTickerProviderStateMixin {
  late AnimationController loadingController;


  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: cubit.selectFile,
                    child: const CustomContainer(),
                  ), cubit.platformFile != null
                      ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selected File',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 1),
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        cubit.file!,
                                        width: 70,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.platformFile!.name,
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${(cubit.platformFile!.size / 1024).ceil()} KB',
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            height: 5,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: Colors.blue.shade50,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: loadingController.value,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 45,
                            onPressed: () {
                              cubit.rmiUpload();
                            },
                            color: AppTheme.basieColor,
                            child: const Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ))
                      : Container(),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              )),
        );
      }, );
  }
}
