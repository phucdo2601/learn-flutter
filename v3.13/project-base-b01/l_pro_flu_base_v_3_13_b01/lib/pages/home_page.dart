import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/post_item.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/toolbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: "Phucdn-app-b01",
        actions: [
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset("assets/svg/ic_location.svg")),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
            user: users[index],
          );
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24,
          );
        },
      ),
    );
  }

  mockUsersFromServer() {
    for (var i = 0; i < 1000; i++) {
      users.add("User number $i");
    }
  }
}
