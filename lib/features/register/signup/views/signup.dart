import 'package:apartmy/core/component/elevated_button.dart';
import 'package:apartmy/features/register/widgets/register_by_social_media.dart';
import 'package:apartmy/features/register/widgets/signup_textfields.dart';
import 'package:apartmy/features/register/widgets/welcoming_message.dart';
import 'package:apartmy/core/component/custom_text_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  subTitleText: 'Let\'s get started',
                ),
                SizedBox(height: 48),
                SignUpTextFields(),
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
                  label: 'Sign Up',
                  onTap: () {},
                ),
                SizedBox(height: 18),
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                ),
                CustomTextButton(
                  label: 'Log In',
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