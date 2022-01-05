import 'package:flutter/material.dart';

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
  String name;
  int age;
  MyApp({required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  //when a widget is created and running, there are 3 functions that we may concern:
  //1. initState
  //2. build() is triggered when we call setState(...)
  //3. dispose() is called when state/widget object removed
  //
  String _email = ""; // this is state

  final emailEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    print('Run initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('Run dispose');
  }

  //when I know "the app is in background/foreground mode"?
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      print('App is in Background mode');
    }else if(state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('Run build()');
    // Now Add a state
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: (
                    TextField(
                      controller: emailEditingController,
                      onChanged: (text){
                        this.setState(() {
                          _email = text; // when text changed => build rerun => reload widget

                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                            ),
                          ),
                          labelText: "Enter your email"
                      ),
                    )


                ),
              ),



              Text(
                /***
                 * truy cap cac thuoc tinh trong class MyApp
                 * this.widget.tenThuocTinh
                 */
                "See Result here: ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow
                ),
              ),

              Text(
                /***
                 * truy cap cac thuoc tinh trong class MyApp
                 * this.widget.tenThuocTinh
                 */
                _email,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}

