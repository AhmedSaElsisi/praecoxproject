import 'package:flutter/cupertino.dart';

import '../models/note_model/tasks_model.dart';

class Tasks extends StatelessWidget {
   Tasks({super.key});
final taskList =Task.generateTaks();
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: GridView.builder(
          itemCount: taskList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemBuilder: (context,index) => taskList[index].isLast
            ? _buildAddTask()
            : _buildTask(context, taskList[index])),
    );
  }
  Widget _buildAddTask(){
    return Text ('Add Task');

  }
  Widget _buildTask(BuildContext context,Task task){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: task.bgColor,borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(task.iconData,color: task.iconColor,size: 35,),
          SizedBox(height: 30,),
          Text(task.title!)
        ],
      ) ,
    );
  }

}
