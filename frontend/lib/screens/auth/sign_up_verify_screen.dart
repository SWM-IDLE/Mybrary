import 'package:flutter/material.dart';
import 'package:mybrary/components/login/login_button_component.dart';
import 'package:mybrary/components/login/login_input_component.dart';
import 'package:mybrary/components/login/login_logo_component.dart';
import 'package:mybrary/constants/color.dart';

class SignUpVerifyScreen extends StatefulWidget {
  const SignUpVerifyScreen({Key? key}) : super(key: key);

  @override
  State<SignUpVerifyScreen> createState() => _SignUpVerifyScreenState();
}

class _SignUpVerifyScreenState extends State<SignUpVerifyScreen> {
  String? emailCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Logo(
                logoText: '회원가입',
              ),
              SizedBox(
                height: 140.0,
              ),
              _SignUpVerifyForm(
                emailCode: emailCode ?? '',
                onSignUpSaved: (String? val) {
                  emailCode = val;
                },
                isVerifyEnabled: emailCode != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpVerifyForm extends StatelessWidget {
  final String emailCode;
  final FormFieldSetter<String> onSignUpSaved;
  final bool isVerifyEnabled;

  const _SignUpVerifyForm({
    required this.emailCode,
    required this.onSignUpSaved,
    required this.isVerifyEnabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BLACK_COLOR,
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              'test@gmail.com',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginInput(
            initialValue: emailCode,
            onSaved: onSignUpSaved,
            hintText: '인증코드',
            validator: (String? val) {
              return null;
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          LoginButton(
            onPressed: () {},
            isEnabled: isVerifyEnabled,
            isOAuth: false,
            btnText: '가입하기',
            btnBackgroundColor: LOGIN_PRIMARY_COLOR,
            textColor: BLACK_COLOR,
          ),
        ],
      ),
    );
  }
}