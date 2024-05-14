// import 'package:get/get.dart';
// import 'package:praecoxproject/local_db/db_helper.dart';
//
// import '../../models/note_model/task.dart';
//
// class TaskController extends GetxController{
//   @override
//   void onReady(){
//     super.onReady();
//   }
//   var taskList= <Task>[].obs;
//
//
//   Future<int> addTask({Task? task})async{
//     return await DataBaseService.insert(task);
//   }
//   void getTasks()async {
//     List<Map<String,dynamic>> tasks =await DataBaseService.query();
//     taskList.assignAll(tasks.map((data) =>  Task.fromJson(data)).toList());
//   }
// }