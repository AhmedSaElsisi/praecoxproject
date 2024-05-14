//
// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:intl/intl.dart';
// import 'package:praecoxproject/style/app_colors.dart';
// import 'package:praecoxproject/views/note/add_task_screen.dart';
// import 'package:praecoxproject/views/notification/notification_services.dart';
//
// import '../../controller/task_controller/task_controller.dart';
// import '../../local_db/db_helper.dart';
// import '../../style/theme.dart';
// import '../../widgets/note_add_task_button.dart';
// import '../home_screen/layout_screen.dart';
//
// class NoteHomeScreen extends StatefulWidget {
//   const NoteHomeScreen({super.key});
//
//   @override
//   State<NoteHomeScreen> createState() => _NoteHomeScreenState();
// }
//
// class _NoteHomeScreenState extends State<NoteHomeScreen> {
//   DateTime _selectedDate= DateTime.now();
//   final  _taskController=Get.put(TaskController());
//
//   @override
//   void initState(){
//      DataBaseService.initDb();
//     super.initState();
//     setState(() {
//       print('I am Here');
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     print('build method called');
//     return Scaffold(
//       appBar:  AppBar(
//         backgroundColor: AppTheme.basieColor,
//         //Color(0xFF404040) ,
//         // shape: const RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(
//         //     bottom: Radius.circular(45),
//         //   ),
//         // ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.white,),
//           onPressed: () {
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LayoutScreen()));
//           },
//         ),
//         title: const Text('Note', style:
//         TextStyle(
//             color: Colors.white
//         ),),
//
//       ),
//       body: Column(
//         children: [
//           // _showTasks(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(DateFormat.yMMMd().format(DateTime.now()),
//                       style: subHeadingStyle,
//
//                     ),
//                     Text('Today',
//                     style: headingStyle,),
//                   ],
//                 ),
//               ),
//               NoteAddTaskButton(label: '+ Add Task',onTap:()async{
//                await  Get.to(()=>AddTaskScreen());
//                _taskController.getTasks();
//
//               }
//               )
//             ],
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 20,left: 16),
//             child: DatePicker(
//               DateTime.now(),
//               height: 100,
//               width: 80,
//               initialSelectedDate: DateTime.now(),
//               selectionColor: AppTheme.basieColor,
//               dateTextStyle: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: AppTheme.grey,
//               ),
//               dayTextStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: AppTheme.grey,
//               ),
//               monthTextStyle: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: AppTheme.grey,
//               ),
//               onDateChange: (date){
//                 _selectedDate=date;
//               },
//             ),
//           ),
//           _showTasks()
//         ],
//       ),
//     );
//   }
//   _showTasks(){
//     return Expanded(
//         child: Obx((){
//           return ListView.builder(
//             itemCount: _taskController.taskList.length,
//               itemBuilder: (_,index){
//               print(_taskController.taskList.length);
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 10),
//                   width: 300,
//                   height: 300,
//                   color: Colors.black,
//                   child: Text(
//                     _taskController.taskList[index].title.toString()
//                   ),
//                 );
//               });
//         }),
//     );
//   }
//
//   }
//
