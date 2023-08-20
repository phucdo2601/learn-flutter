import 'package:l_pro_flu_base_v_3_13_b01/pages/edit_profile_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/home_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/login_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/main_page.dart';

class AppRoutes {
  static final pages = {
    '/': (context) => LoginPage(),
    '/home': (context) => HomePage(),
    '/main': (context) => MainPage(),
    '/edit_profile': (context) => EditProfilePage(),
  };

  static const login = "/";
  static const home = "/home";
  static const main = "/main";
  static const editProfilePage = "/edit_profile";


}