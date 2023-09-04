import 'package:flutter/material.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}

