import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../style/app_colors.dart';
import 'dr_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorHomeScreen(),
    );
  }
}

class User {
  String name;
  String phone;
  File? image;

  User({required this.name, required this.phone, this.image});
}

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  List<User> users = [
    User(name: 'John Doe', phone: '123-456-7890'),
    User(name: 'Jane Smith', phone: '987-654-3210'),
    User(name: 'Alice Johnson', phone: '555-666-7777'),
    User(name: 'Bob Brown', phone: '444-555-6666'),
    User(name: 'Charlie Davis', phone: '111-222-3333'),
  ];

  Future<void> _pickImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        users[index].image = File(pickedFile.path);
      });
    }
  }

  void _editProfile(int index) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    nameController.text = users[index].name;
    phoneController.text = users[index].phone;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        users[index].name = nameController.text;
                        users[index].phone = phoneController.text;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:  8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfile()));
              },
                child: Icon(Icons.person_2,color: AppTheme.white,)),
          )
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Credential Profiles',style: TextStyle(
                color: AppTheme.white,fontWeight: FontWeight.bold
            ),),
          ],
        ),
        backgroundColor: AppTheme.basieColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppTheme.basieColor.withOpacity(0.2), // Transparent background
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _pickImage(index),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: users[index].image != null ? FileImage(users[index].image!) : null,
                    child: users[index].image == null
                        ? Icon(
                      Icons.person,
                      size: 40,
                    )
                        : null,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      users[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      users[index].phone,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editProfile(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
