import 'package:flutter/material.dart';
import 'package:praecoxproject/models/signup_model/signup_model.dart';
import 'package:praecoxproject/widgets/signup_item.dart';

import '../../widgets/custom_scaffold.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupItem(),
    );

  }
}
