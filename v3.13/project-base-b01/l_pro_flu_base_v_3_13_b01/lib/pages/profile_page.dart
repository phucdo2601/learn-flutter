import 'package:flutter/material.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/toolbar.dart';
import 'package:l_pro_flu_base_v_3_13_b01/components/user_avatar.dart';
import 'package:l_pro_flu_base_v_3_13_b01/config/app_routes.dart';
import 'package:l_pro_flu_base_v_3_13_b01/styles/app_text.dart';

enum ProfileMenu {
  edit,
  logout,
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: "Profile",
        actions: [
          PopupMenuButton<ProfileMenu>(onSelected: (value) {
            switch (value) {
              case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editProfilePage);
                break;

              case ProfileMenu.logout:
                print("log out");
                break;
              default:
            }
          },
              icon: Icon(Icons.more_vert_rounded),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("Edit"), value: ProfileMenu.edit,),
                  PopupMenuItem(
                    child: Text("Logout"), value: ProfileMenu.logout,),
                ];
              })
        ],
      ),
      body: Column(
        children: [

          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Phucdn",
            style: AppText.header2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Viet Nam",
            style: AppText.subtitle3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "472",
                    style: AppText.header2,
                  ),
                  Text(
                    "Followers",
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "125",
                    style: AppText.header2,
                  ),
                  Text(
                    "Posts",
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "2000",
                    style: AppText.header2,
                  ),
                  Text(
                    "Following",
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            endIndent: 30,
          ),
        ],
      ),
    );
  }
}
