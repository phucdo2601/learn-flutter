import 'package:flutter/material.dart';
import 'package:learn_login_full_with_api_b02/core/controllers/login/login_switch_controller.dart';
import 'package:learn_login_full_with_api_b02/core/models/user_model.dart';
import 'package:learn_login_full_with_api_b02/core/services/login/login_service.dart';
import 'package:learn_login_full_with_api_b02/core/views/home/home_view.dart';
import 'package:learn_login_full_with_api_b02/core/views/login/login_view.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: LoginSwitchController.instance.themeSwitch,
//       builder: (context, isDark, child) =>
//           MaterialApp(
//             home: FutureBuilder(
//               future: LoginSerivce().getUser(),
//               builder: (context, snapshot) {
//                 switch(snapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return Center(
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           Colors.black
//                         ),
//                         strokeWidth: 3.0,
//                       ),
//                     );
//
//                   case ConnectionState.none:
//                     return Center(
//                       child: Text(
//                         "No Internet, try to stay connected"
//                       ),
//                     );
//
//                   default:
//                     if(snapshot != null) {
//                       return HomeView(user: snapshot.data);
//                     } else {
//                       return LoginView();
//                     }
//                 }
//               }
//             ),
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               brightness: isDark == true ? Brightness.dark : Brightness.light,
//             ),
//             initialRoute: '/login',
//             routes: {
//           '/login': (_) => LoginView(),
//           },
//           ),
//     );
//   }
// }

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginSerivce().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return LoginView();
              default:
                if (snapshot.data != null) {
                  return HomeView(user: snapshot.data as UserModel);
                } else {
                  return LoginView();
                }
            }
          },
        ),
        theme:
        ThemeData(brightness: isDark == true ? Brightness.dark : Brightness.light),
        routes: {
          '/login': (_) => LoginView(),
        },
      ),
    );
  }
}
