import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("Learn Flutter b01"),
        centerTitle: false,
        actions: [Icon(Icons.location_on_outlined)],
      ),
      body: ListView(
        children: mockUsersFromServer(),
      ),
    );
  }

  Widget _userItem(){
    return Row(
      children: [
        Image.asset(
          'assets/temp/user1.png',
          width: 40,
          height: 40,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "Phucdn",
        ),
      ],
    );
  }

  List<Widget> mockUsersFromServer() {
    List<Widget> users = [];

    for(var i = 0; i < 1000; i++) {
      users.add(_userItem());
    }
    return users;
  }
}
