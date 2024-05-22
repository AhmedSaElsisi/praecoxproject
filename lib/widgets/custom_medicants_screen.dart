import 'package:flutter/material.dart';
import 'package:praecoxproject/views/home_screen/home_screen.dart';

import '../medicants_screen/VeryMildDemented/verymilddementedscreen1.dart';
import '../style/app_colors.dart';
import '../views/home_screen/layout_screen.dart';

class CustomMedicantScreen extends StatelessWidget {
  const CustomMedicantScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color(0xFF404040) ,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(45),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            },
          ),
          title: const Text('Medicants',style:
          TextStyle(
              color: Colors.white
          ),),
          actions: [
            TextButton(
              onPressed: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Medicants2()));
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                      height: 120,
                      child: Image.asset("assets/images/Pills.png")),
                ),
                const Text('Donepezil'
                  ,style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Row(
                  children: [
                    Container(
                      width: 156.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Task--complete.png'),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'once daily',
                            style: TextStyle(
                              color: Color(0xFF42BE65),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )

                    ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Donepezil hydrochloride is an acetylcholinesterase inhibitor most commonly used for the treatment of Alzheimer disease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text('Adverse effect',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               const Text('\r•nausea \nvomiting, diarrhea and abdominal cramp\n•Increased rate of syncope bradycardia \n•pacemaker insertion ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text( 'Drug drug Interaction',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(' \r  •Atropine \n•Benztropine(cogentin) \n•Trihexyphenidyl(artane)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.grey,
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
