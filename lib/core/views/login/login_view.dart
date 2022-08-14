import 'package:flutter/material.dart';
import 'package:learn_login_full_with_api_b02/core/components/login/login_switch_button.dart';
import 'package:learn_login_full_with_api_b02/core/interfaces/login/login_interface.dart';
import 'package:learn_login_full_with_api_b02/core/models/user_model.dart';
import 'package:learn_login_full_with_api_b02/core/services/login/login_service.dart';
import 'package:learn_login_full_with_api_b02/core/views/home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ILogin _loginService = LoginSerivce();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          LoginSwitchButton()
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Card(
                  borderOnForeground: true,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: 'E-mail'),
                          textInputAction: TextInputAction.next,
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(hintText: 'Password'),
                          textInputAction: TextInputAction.done,
                          // onEditingComplete: () async{
                          //   UserModel response = await _loginService.login(
                          //       _emailController.text,
                          //       _passwordController.text);
                          //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //       builder: (_) => HomeView(user: response)
                          //   ));
                          // },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        ElevatedButton(
                          child: Text('Login'),
                          onPressed: () async {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              UserModel user = await _loginService.loginHttp(
                                  _emailController.text,
                                  _passwordController.text);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => HomeView(user: user),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text('email or password incorrect'),
                                  ),
                                );
                                return null;
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
