import 'package:flutter/material.dart';
import '../../style/app_colors.dart';
import '../../style/theme.dart';
import '../../widgets/task_input_field.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  String _selectedMedical1 = 'None';
  String _selectedMedical2 = 'None';
  String _selectedMedical3 = 'None';
  String _selectedMedical4 = 'None';

  List<String> repeatList = [
    'diabetes',
    'Irritable bowel disease ',
    'Heart disease',
    'Hypertension'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Form',style: TextStyle(
          color: AppTheme.basieColor,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20,top: 20),
          child: Column(
            children: [
              TaskInputField(
                title: 'Medical History',
                hint: '$_selectedMedical1 ',
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.basieColor),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  items: repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: AppTheme.grey)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMedical1 = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              TaskInputField(
                title: 'Medical History',
                hint: '$_selectedMedical2 ',
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.basieColor),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  items: repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: AppTheme.grey)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMedical2 = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              TaskInputField(
                title: 'Medical History',
                hint: '$_selectedMedical3 ',
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.basieColor),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  items: repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: AppTheme.grey)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMedical3 = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              TaskInputField(
                title: 'Medical History',
                hint: '$_selectedMedical4 ',
                widget: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.basieColor),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  items: repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: AppTheme.grey)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMedical4 = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width:200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Color(0xFF0F62FE),
                  ),
                  onPressed: () {},
                  child: const Text(
                    ' Submit',
                    style: TextStyle(
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
