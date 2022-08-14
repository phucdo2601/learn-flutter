import 'package:flutter/material.dart';
import 'package:learn_login_full_with_api_b02/core/interfaces/login/switch_button_interface.dart';
import 'package:learn_login_full_with_api_b02/core/models/login/login_switch_model.dart';
import 'package:learn_login_full_with_api_b02/core/services/login/switch_button_services.dart';

class LoginSwitchController {
  LoginSwitchController._(){
    storage.getK('dark').then((value) {
      themeSwitch.value = value;
    });
  }
  static final LoginSwitchController instance = LoginSwitchController._();

  final config = LoginSwitchModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier get themeSwitch => config.themeSwitch;
  final ISwitchButton storage = SwitchButtonServices();


  Future<void> changeTheme(value) async {
    themeSwitch.value = value;
    storage.put("dark", value);
  }
}