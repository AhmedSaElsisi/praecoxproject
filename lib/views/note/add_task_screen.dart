//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:praecoxproject/controller/task_controller/task_controller.dart';
// import 'package:praecoxproject/models/note_model/task.dart';
// import 'package:praecoxproject/style/theme.dart';
// import 'package:praecoxproject/views/note/note_home_screen.dart';
// import 'package:praecoxproject/widgets/task_input_field.dart';
//
// import '../../style/app_colors.dart';
// import '../../widgets/note_add_task_button.dart';
//
// class AddTaskScreen extends StatefulWidget {
//   const AddTaskScreen({super.key});
//
//   @override
//   State<AddTaskScreen> createState() => _AddTaskScreenState();
// }
//
// class _AddTaskScreenState extends State<AddTaskScreen> {
//   final TaskController _taskController =Get.put(TaskController());
//   final TextEditingController _titleController =TextEditingController();
//   final TextEditingController _noteController =TextEditingController();
//   DateTime _selectedDate = DateTime.now();
//   String _endTime ='9:30 PM';
//   String _startTime =DateFormat('hh:mm:a').format(DateTime.now()).toString();
//   int _selectedRemind =5;
//   List<int>remindList=[
//     5,
//     10,
//     15,
//     20
//   ];
//   String _selectedRepeat= '';
//   List<String>repeatList=[
//     'None',
//     'Daily',
//     'Weakly',
//     'Monthly'
//   ];
//   int _selectedColor=0;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:  AppBar(
//         elevation: 0,
//         backgroundColor: AppTheme.white,
//         //Color(0xFF404040) ,
//         // shape: const RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.vertical(
//         //     bottom: Radius.circular(45),
//         //   ),
//         // ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.black,),
//           onPressed: () {
//            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NoteHomeScreen()));
//           },
//         ),
//
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 20,right: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Add Task',style: headingStyle, ),
//               TaskInputField(title: 'Title', hint: 'Enter your title',controller: _titleController,),
//               TaskInputField(title: 'Note', hint: 'Enter your note',controller: _noteController,),
//               TaskInputField(title: 'Date', hint: DateFormat.yMd().format(_selectedDate),widget: IconButton(
//               icon: const Icon(Icons.calendar_today_outlined,
//                 color: AppTheme.basieColor,
//               ),
//                 onPressed: () { _getDateFormUser(context); },
//               ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child:TaskInputField(
//                     title: 'Start Time',
//                     hint: _startTime ,
//                     widget: IconButton(
//                       onPressed: (){
//                         _getTimeFromUser(isStartTime: true);
//                       },
//                       icon: const Icon(Icons.access_time_outlined,color: AppTheme.basieColor,),
//                     ),
//                   ),
//
//                   ),
//                   const SizedBox(width: 12,),
//                   Expanded(child:TaskInputField(
//                     title: 'End Time',
//                     hint: _endTime ,
//                     widget: IconButton(
//                       onPressed: (){
//                         _getTimeFromUser(isStartTime: false);
//
//                       },
//                       icon: const Icon(Icons.access_time_outlined,color: AppTheme.basieColor,),
//                     ),
//                   ),
//
//                   )
//                 ],
//               ),
//               TaskInputField(title: 'Remind', hint: '$_selectedRemind minutes early',widget: DropdownButton(
//                 icon: const Icon(Icons.keyboard_arrow_down,color: AppTheme.basieColor,),
//                 iconSize: 32,
//                 elevation: 4,
//                 style: subTitleStyle,
//                 underline: Container(height: 0,),
//                 items: remindList.map<DropdownMenuItem<String>>((int value){
//                   return DropdownMenuItem<String>(
//                     value: value.toString(),
//                     child:  Text(value.toString()),
//                   );
//                 }
//                 ).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedRemind=int.parse(newValue!);
//                   });
//                 },
//               ),
//               ),
//               TaskInputField(title: 'Reapeat', hint: '$_selectedRepeat ',widget: DropdownButton(
//                 icon: const Icon(Icons.keyboard_arrow_down,color: AppTheme.basieColor,),
//                 iconSize: 32,
//                 elevation: 4,
//                 style: subTitleStyle,
//                 underline: Container(height: 0,),
//                 items: repeatList.map<DropdownMenuItem<String>>((String value){
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child:  Text(value,style: TextStyle(color: AppTheme.grey),),
//                   );
//                 }
//                 ).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedRepeat=newValue!;
//                   });
//                 },
//               ),
//               ),
//               const SizedBox(height: 18,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _colorpallete(),
//                   NoteAddTaskButton(label: 'Create task', onTap: ()=>_validateDate())
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   _colorpallete(){
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Color',style: titleStyle,),
//         Wrap(
//           children: List<Widget>.generate(3, (int index){
//             return GestureDetector(
//               onTap: (){
//                 setState(() {
//                   _selectedColor=index;
//
//                 });
//
//               },
//               child: Padding(
//                   padding: const EdgeInsets.only(right:  8.0),
//                   child: (
//                       CircleAvatar(
//                         radius: 13,
//                         backgroundColor: index==0?AppTheme.red:index==1?AppTheme.green:AppTheme.basieColor,
//                         child: _selectedColor== index?const Icon(Icons.done,
//                           color: AppTheme.white,
//                           size: 16,
//                         ):Container(),
//                       )
//                   )
//               ),
//             );
//           }),
//         )
//       ],
//     );
//   }
//   _validateDate(){
//     if (_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
//       _addTaskToDb();
//       Get.back();
//     }else if (_titleController.text.isEmpty || _noteController.text.isEmpty){
//       Get.snackbar('Required', 'All fields are reequired !',
//       snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: AppTheme.white,
//         colorText: AppTheme.red,
//         icon: const Icon(Icons.warning_amber_outlined),
//       );
//     }
//   }
//   _addTaskToDb()async{
//     int value = await _taskController.addTask(
//       task: Task(
//         note: _noteController.text,
//         title: _titleController.text,
//         date: DateFormat.yMd().format(_selectedDate),
//         startTime: _startTime,
//         endTime: _endTime,
//         remind: _selectedRemind,
//         repeat: _selectedRepeat,
//         color: _selectedColor,
//         isCompleted: 0,
//       )
//     );
//     print('My id is + $value');
//   }
//   _getDateFormUser(BuildContext context)async{
//     DateTime? _pickerDate =await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2124)
//     );
//     if(_pickerDate!=null){
//       _selectedDate=_pickerDate;
//       setState(() {
//         _selectedDate=_pickerDate;
//         print(_selectedDate);
//       });
//     }else{
//       print('some thing is wrong');
//     }
//   }
//   _getTimeFromUser({required bool isStartTime})async{
//     var pickedTime= await _showTimePicker();
//     String _formatedTime =pickedTime.format(context);
//     if(pickedTime==null){
//       print('Time Cncelled');
//     }else if(isStartTime==true){
//       setState(() {
//         _startTime=_formatedTime;
//
//       });
//
//     }else if(isStartTime==false){
//       setState(() {
//         _endTime=_formatedTime;
//
//       });
//     }
//   }
//   _showTimePicker(){
//     return showTimePicker(
//       initialEntryMode: TimePickerEntryMode.input ,
//         context :context,
//       initialTime: TimeOfDay(
//           hour: int.parse(_startTime.split(':')[0]),
//           minute: int.parse(_startTime.split(':')[1].split('')[0]),
//       )
//     );
//   }
// }
//
