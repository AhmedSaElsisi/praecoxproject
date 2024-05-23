import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praecoxproject/cubit/rmi_upload_cubit/rmi_upload_state.dart';
import 'package:praecoxproject/dignose.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';
import '../../cubit/patient_register_cubit/patient_register_cubit.dart';
import '../../cubit/patient_register_cubit/patient_register_state.dart';
import '../../cubit/rmi_upload_cubit/rmi_upload_cubit.dart';
import '../../local_db/enums.dart';
import '../../local_db/shared_preferences.dart';
import '../../widgets/custom_upload_container.dart';
import '../../widgets/widget.dart';

class RmiUpload extends StatefulWidget {
  const RmiUpload({super.key});
  @override
  _RmiUploadState createState() => _RmiUploadState();
}

class _RmiUploadState extends State<RmiUpload>
    with SingleTickerProviderStateMixin {
  late AnimationController? loadingController;
  String? imagePath;
  String? imageName;
  File? file;
  PlatformFile? platformFile;
  RmiUpload? rmi;

  selectFile() async {
    final _file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (_file != null) {
      imagePath = _file.files[0].path;
      imageName = _file.files[0].name;
      file = File(_file.files.single.path!);
      platformFile = _file.files.first;
      print(file?.path);
      print(_file.files[0].name);
    }
    loadingController?.forward();
  }

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
    return BlocConsumer<RmiUploadCubit, RmiUploadState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RmiUploadCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              const CustomWidget(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: selectFile,
                child: const CustomContainer(),
              ),
              platformFile != null
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
                                        file!,
                                        width: 70,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          platformFile!.name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${(platformFile!.size / 1024).ceil()} KB',
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
                                              value: loadingController?.value,
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
                              cubit
                                  .rmiUpload(
                                      imagePath: imagePath!,
                                      imageName: imageName!)
                                  .then((value) {
                                //SharedPrefrenceHelper.saveData(key: 'key', value: cubit.rmiUploadModel);
                                //CashHelper.putString(key: MyKeyCache.diagnosticStage, value: cubit.rmiUploadModel!.diagnosticStage!);
                               SharedPrefrenceHelper.saveData(key: 'diagnos', value: cubit.rmiUploadModel!
                                   .diagnosticStage!);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowDignose()));
                                print(cubit.rmiUploadModel!.diagnosticStage!);
                                print(cubit.rmiUploadModel!.descriptionDiagnosis!);
                              });
                            },
                            color: AppTheme.basieColor,
                            child: const Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
      },
    );
  }
}
