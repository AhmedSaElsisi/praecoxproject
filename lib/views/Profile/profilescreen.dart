import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:praecoxproject/views/Settings/settingsscreen.dart';
class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text('Profile',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
        backgroundColor: const Color(0xFF404040),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        leading: IconButton(
          onPressed: () {
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
          },
          icon: const Icon(Ionicons.chevron_back_outline,color: Colors.white,),
        ),
        leadingWidth: 80,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Email', 'ahadhashmideveloper@gmail.com',
                  CupertinoIcons.mail),
              const SizedBox(height: 10),
              itemProfile('Phone', '03107085816', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile(
                  'Address', 'abc address, xyz city', CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile(
                  'National Id', '302030105266', CupertinoIcons.number_circle),
              const SizedBox(height: 10),
              itemProfile('Gender', 'male', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('Date', '20-20-2024', CupertinoIcons.calendar),
              const SizedBox(height: 10),
              itemProfile('Age', '22', CupertinoIcons.calendar_today),
              const SizedBox(height: 10),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Color(0xFF0F62FE),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Edit Profile',style:
                      TextStyle(
                      color: Colors.white
                      ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color(0xFF0F62FE).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}

