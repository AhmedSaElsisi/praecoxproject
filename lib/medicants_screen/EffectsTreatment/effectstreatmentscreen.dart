import 'package:flutter/material.dart';
import 'package:praecoxproject/views/home_screen/layout_screen.dart';
import '../../style/app_colors.dart';
class EffectsTreatment extends StatelessWidget {
  const EffectsTreatment({super.key});

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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LayoutScreen()));
            },
          ),
          title: const Text('Medicants', style:
          TextStyle(
              color: Colors.white
          ),),
          actions: [

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
                const Text('Treatment of behavioral and psychological symptoms of dementia ( all stages of alzheimer disease)',
                  textAlign:TextAlign.center ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.0,
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
                            '',
                            style: TextStyle(
                              color: Color(0xFF42BE65),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Calendar.png'),
                          const SizedBox(height: 5.0),
                          const Text(
                            'This Month',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '',
                            style: TextStyle(
                              color: Color(0xFFF1C21B),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Dicom--overlay.png'),
                          const SizedBox(height: 5.0),
                          const Text(
                            'Cause',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Alzheimer',
                            style: TextStyle(
                              color: Color(0xFFFA4D56),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100.0,
                  height: 72.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Medication--alert.png'),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Cap Size',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                          color: Color(0xFFF4589FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Text('Go back to the doctor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Use of Cholinestrase inhibitors with memantineSerotonin reuptake inhibitors like:',
                  textAlign:TextAlign.center ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),const Text('.flouxetine \n.sertraline \n.Mirtazapine drug \n.venlafexine drug',
                  textAlign:TextAlign.center ,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.grey
                  ),
                ),


              ],
            ),
          ),
        )

    );
  }
}
