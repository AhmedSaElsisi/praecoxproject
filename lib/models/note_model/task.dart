// class Task{
//   int? id;
//   String? title;
//   String? date;
//   String? note;
//   int? isCompleted;
//   String ?startTime;
//   String ?endTime;
//   int? color;
//   int? remind;
//   String ?repeat;
//   Task({
//     this.id,
//     this.title,
//     this.date,
//     this.note,
//     this.isCompleted,
//     this.startTime,
//     this.endTime,
//     this.color,
//     this.remind,
//     this.repeat,
// });
//   Task.fromJson(Map<String,dynamic> json){
//     id =json['id'];
//     title =json['title'];
//     date =json['date'];
//     note =json['note'];
//     isCompleted =json['isCompleted'];
//     startTime =json['startTime'];
//     endTime =json['endTime'];
//     color =json['color'];
//     remind =json['remind'];
//     repeat =json['repeat'];
//   }
//   Map<String,dynamic> toJson(){
//     final Map<String,dynamic> data =new Map<String,dynamic>();
//     data['id']=id;
//     data['title']=title;
//     data['date']=date;
//     data['note']=note;
//     data['isCompleted']=isCompleted;
//     data['startTime']=startTime;
//     data['endTime']=endTime;
//     data['color']=color;
//     data['remind']=remind;
//     data['repeat']=repeat;
//     return data;
// }
// }