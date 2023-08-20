import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l_pro_flu_base_v_3_13_b01/config/app_icons.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/home_page.dart';
import 'package:l_pro_flu_base_v_3_13_b01/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icHome),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icFavorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icAdd),
            label: "Add Post",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icMessage),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icUser),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(
      child: Text('Favorite'),
    ),
    Center(
      child: Text('Add Post'),
    ),
    Center(
      child: Text('Messages'),
    ),
    ProfilePage(),
  ];
}
