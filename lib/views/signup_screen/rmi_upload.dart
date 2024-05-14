import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  String? imagePath;
  String? imageName;
  File? _file;
  PlatformFile? _platformFile;
  RmiUpload? rmi;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {
        imagePath =file.files[0].path;
        imageName =file.files[0].name;
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
        print(_file?.path);
        print(file.files[0].name);
      });
    }

    loadingController.forward();
  }

  Future rmiUpload()async{
    var data = FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(imagePath!, filename: imageName)
      ],

    });
    try{
      var response =await Dio().request('https://praecox.future-developers.cloud/api/Diagnostic/store',
          options: Options(
              headers: {
                'Accept':'application/json',
                'Content-Type':'application/json',
                'Authorization':'Bearer mcZ5k8DdwJHlsFj7VEmCX43oZx6l0QNk95qFNb6B523772a3'
              },
              method: 'POST'
          ),
          data: data

      );
      if(response.statusCode==200){
        print('successfully upload');
      //  rmi =RmiUpload.fromJson(response.data);
      }else{
      }
    }catch(error){
      print(error);
    }
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
          _platformFile != null
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
                                    _file!,
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
                                      _platformFile!.name,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${(_platformFile!.size / 1024).ceil()} KB',
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
                          rmiUpload();
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
  }
}
