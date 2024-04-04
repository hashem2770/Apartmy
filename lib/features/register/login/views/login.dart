import 'package:flutter/material.dart';

import '../../../../core/component/custom_text_button.dart';
import '../../../../core/component/elevated_button.dart';
import '../../widgets/login_textfields.dart';
import '../../widgets/register_by_social_media.dart';
import '../../widgets/welcoming_message.dart';
class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                WelcomingMessage(
                  titleText: 'Welcome',
                  subTitleText: 'Log in to your account',
                ),
                SizedBox(height: 48),
                LogInTextFields(),
                SizedBox(height: 32),
                Center(
                  child: Text(
                    'Or',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 32),
                SignUpBySocialMedia(),
                SizedBox(height: 64),
                CustomButton(
                  label: 'Log In',
                  onTap: () {},
                ),
                SizedBox(height: 18),
                Text(
                  ' Don\'t have an account?',
                  style: TextStyle(color: Colors.black),
                ),
                CustomTextButton(
                  label: 'Sign up',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
