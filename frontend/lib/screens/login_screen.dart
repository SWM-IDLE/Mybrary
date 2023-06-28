import 'package:flutter/material.dart';
import 'package:mybrary/components/login/login_box_component.dart';
import 'package:mybrary/components/login/login_button_component.dart';
import 'package:mybrary/components/login/login_input_component.dart';
import 'package:mybrary/components/login/login_logo_component.dart';
import 'package:mybrary/constants/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Logo(),
              ),
              Expanded(
                flex: 4,
                child: LoginBox(
                  signWidget: _LoginForm(),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgotText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: LOGIN_PRIMARY_COLOR,
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SelfLogin(),
        _DividerLogin(),
        _OAuthLogin(),
      ],
    );
  }
}

class _SelfLogin extends StatelessWidget {
  const _SelfLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginInput(
          hintText: '이메일',
          backgroundColor: LOGIN_INPUT_COLOR,
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginInput(
          hintText: '비밀번호',
          backgroundColor: LOGIN_INPUT_COLOR,
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginButton(
          btnText: '로그인',
          btnBackgroundColor: LOGIN_PRIMARY_COLOR,
          textColor: Colors.black,
        ),
        SizedBox(
          height: 20.0,
        ),
        _ForgotText(
          forgotText: '비밀번호를 잊으셨나요?',
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

class _DividerLogin extends StatelessWidget {
  const _DividerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _DividerLine(),
        _DividerLine(),
      ],
    );
  }
}

class _OAuthLogin extends StatelessWidget {
  const _OAuthLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginButton(
          btnText: 'Google로 시작하기',
          btnBackgroundColor: GOOGLE_COLOR,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginButton(
          btnText: 'Naver로 시작하기',
          btnBackgroundColor: NAVER_COLOR,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginButton(
          btnText: 'Kakao로 시작하기',
          btnBackgroundColor: KAKAO_COLOR,
          textColor: Colors.black,
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ForgotText(
              forgotText: '계정이 없으신가요?',
              fontWeight: FontWeight.w300,
            ),
            SizedBox(
              width: 5.0,
            ),
            _ForgotText(
              forgotText: '회원가입',
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

class _ForgotText extends StatelessWidget {
  final String forgotText;
  final FontWeight fontWeight;
  const _ForgotText({
    required this.forgotText,
    required this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: LOGIN_PRIMARY_COLOR,
      fontSize: 15.0,
      fontWeight: fontWeight,
    );

    return Text(
      forgotText,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 130,
      child: Divider(
        color: LESS_BLACK_COLOR,
        thickness: 1.0,
      ),
    );
  }
}