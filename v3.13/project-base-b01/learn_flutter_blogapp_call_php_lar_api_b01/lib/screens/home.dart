import 'package:flutter/material.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/login.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (route) => false)
            });
          },
          child: Text(
            "Logout Button"
          ),
        ),
      ),
    );
  }
}
