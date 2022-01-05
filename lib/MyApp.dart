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
    //Now how to display a Datetime
    DateTime now = new DateTime.now();
    DateTime someDate = new DateTime(2022, 5, 2);
    // Now Add a state
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                /***
                 * truy cap cac thuoc tinh trong class MyApp
                 * this.widget.tenThuocTinh
                 */
                // "${someDate.toString()}", //you want to change to a format like "yyyy-MM-dd"
                //let 's use extra library, intl
                // DateFormat.yMMMd().format(now),
                NumberFormat('###.0#', 'en_US').format(12.345678),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow
                ),
              ),

            ],
          )
        ),
      )
    );
  }
}

