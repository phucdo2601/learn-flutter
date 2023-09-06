import 'package:flutter/material.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/login.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/post_form.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/post_screen.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/profile.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        actions: [
          IconButton(
            onPressed: () {
              logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false)
                  });
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),

      body: currentIndex == 0 ? PostScreen() : Profile(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostForm()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
        ),
      ),
    );
  }
}
