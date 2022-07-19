import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_login_gmail_by_flutter_b01/screens/login.dart';
import 'package:learn_login_gmail_by_flutter_b01/services/firebase_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
