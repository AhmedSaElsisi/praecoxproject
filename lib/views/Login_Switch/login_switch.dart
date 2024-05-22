import 'package:flutter/material.dart';
import 'package:praecoxproject/views/Doctor/dr_signin.dart';

import '../signin_screen/signin_screen.dart';

class LoginSwitch extends StatefulWidget {
  const LoginSwitch({super.key});

  @override
  _LoginSwitchState createState() => _LoginSwitchState();
}

class _LoginSwitchState extends State<LoginSwitch>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF7F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 70,),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0F62FE),
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: const Color(0xFFFCF7F7),
                          labelColor: Colors.black,
                          indicatorColor: const Color(0xFFFCF7F7),
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: const Color(0xFFFCF7F7),
                            borderRadius: BorderRadius.circular(110),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Credential',
                            ),
                            Tab(
                              text: 'Doctor',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children:  [
                      SignInScreen(),
                      DrSignInScreen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}