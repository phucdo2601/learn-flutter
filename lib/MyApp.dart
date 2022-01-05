import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class MyApp extends StatelessWidget {
//   //Private: thay doi thi giao dien thay doi theo
//   //StatelessWidget: widget which donot have "state" (property) which has been changed <-> User Interface
//
//   String name;
//   int age;
//
//   MyApp({required this.name, required this.age});
//
//   @override
//   Widget build(BuildContext context) {
//     // build abstract method from parent class(StatelessWidget)
//     // return Center(child: Text( //chi hien thong tin cac sau ki tu
//     //     "Hello User, name: ${this.name}, age: ${this.age}",
//     //     //font size
//     //     style: TextStyle(fontSize: 30),
//     //     textDirection: TextDirection.ltr//left to right
//     //
//     // ), //Text, Center
//     // );
//
//     return MaterialApp(
//         title: "This is my first app by PhucDn!",
//         home: Scaffold(
//           body: Center(child: Text( //chi hien thong tin cac sau ki tu
//               "Hello Username welcome to my app, name: ${this.name}, age: ${this.age}",
//               //font size
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red
//               ),
//               textDirection: TextDirection.ltr//left to right
//
//           ), //Text, Center
//           ),
//         )
//     );
//   }
// }

/**
 * Moi StateFulWidget duoc tao thanh tu 2 class
 * public class ke thua tu StatefulWidget
 * private class de ve giao dien
 */
class MyApp extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  //khoi tao doi tuong GlobalKey de set in ra mh
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //defines states
  String _content ="";
  double _amount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {

    // Now Add a state
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              TextField(
                decoration: InputDecoration(labelText: "Content"),
                controller: _contentController,
                onChanged: (text){
                  this.setState(() {
                    _content = text;
                  });
                },

              ),

              TextField(
                decoration: InputDecoration(labelText: "Ammount(money)"),
                controller: _amountController,
                onChanged: (text){
                  this.setState(() {
                    _amount = double.tryParse(text) ?? 0;
                  });
                },

              ),

              FlatButton(
                onPressed: () {
                  // print('Content = $_content, money\'s $_amount');
                  //Display to UI
                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(content: Text('Content = $_content, money\'s $_amount'))
                  // );

                  _scaffoldKey.currentState?.showSnackBar(
                      SnackBar(
                          content: Text('Content = $_content, money\'s $_amount'),
                        duration: Duration(seconds: 3),
                      )
                    );
                  },
                child: Text("Insert Transaction"),
                textColor: Colors.white,
                color: Colors.blue
              )

            ],
          ),
        )
      )
    );
  }
}

