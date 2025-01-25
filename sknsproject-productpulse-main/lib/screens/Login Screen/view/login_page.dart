import 'package:flutter/material.dart';
import 'package:prodpulseversion3/screens/Login%20Screen/view/component/login_mobile_widget.dart';
import 'package:prodpulseversion3/screens/Login%20Screen/view/component/login_web_widget.dart';
import 'package:prodpulseversion3/widgets/common%20components/common_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonLayoutBuilder(
          webWidget: LoginWebWidget(),
          mobileWidget: LoginMobileWidget(),
        ),
        const Visibility(
          visible: false,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
