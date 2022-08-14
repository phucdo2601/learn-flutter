import 'package:flutter/material.dart';
import 'package:learn_login_full_with_api_b02/core/controllers/login/login_switch_controller.dart';

class LoginSwitchButton extends StatelessWidget {
  const LoginSwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: LoginSwitchController.instance.isDark,
      onChanged: (value) {
        LoginSwitchController.instance.changeTheme(value);
      },
    );
  }
}
