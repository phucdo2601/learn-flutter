import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_datatable_b01/models/item_model.dart';
import 'package:learn_datatable_b01/screens/edit_screen.dart';
import 'package:learn_datatable_b01/screens/view_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataTableSource _listData = MyData().;
  TextEditingController controller = TextEditingController();
  String _searchResult = '';
  List<ItemModel> itemsFiltered = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Card(
            child: new ListTile(
              leading: new Icon(Icons.search),
              title: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      _searchResult = value;
                    });
                  }),
              trailing: new IconButton(
                icon: new Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    controller.clear();
                    _searchResult = '';
                  });
                },
              ),
            ),
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Action')),
            ],
            source: _listData,
            header: const Center(
              child: Text("My Product"),
            ),
            // columnSpacing: 100,
            // horizontalMargin: 60,
            rowsPerPage: 8,
          )
        ],
      ),
    );
  }
}

enum _PopupMenuValue { viewDetailsScreen, viewEditScreen, chickens }

class MyData extends DataTableSource {
  final List<ItemModel> _listData = List.generate(
      200,
          (index) => ItemModel(index.toString(), "Item ${index}", Random().nextInt(10000)));

  @override
  DataRow? getRow(int index) {
    String id = _listData[index].id.toString();

    return DataRow(cells: [
      DataCell(Text((_listData[index].id.toString()))),
      DataCell(Text((_listData[index].title.toString()))),
      DataCell(Text((_listData[index].price.toString()))),
      DataCell(
        PopupMenuButton<_PopupMenuValue>(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
                  backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => ViewDetailsScreen(id: id)));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("View Details"),
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => EditScreen(id: id,)));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Edit"),
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
                  backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('all the chickens are in the coop')));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.offline_bolt,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Test Check"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _listData.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

// class MyDataSearch extends DataTableSource {
//
//   final List<ItemModel> _listData;
//
//   MyDataSearch(this._listData);
//
//   @override
//   DataRow? getRow(int index) {
//     String id = _listData[index].id.toString();
//
//     return DataRow(cells: [
//       DataCell(Text((_listData[index].id.toString()))),
//       DataCell(Text((_listData[index].title.toString()))),
//       DataCell(Text((_listData[index].price.toString()))),
//       DataCell(
//         PopupMenuButton<_PopupMenuValue>(
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor:
//                   Theme.of(context).colorScheme.onSecondaryContainer,
//                   backgroundColor:
//                   Theme.of(context).colorScheme.secondaryContainer,
//                 ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (c) => ViewDetailsScreen(id: id)));
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.remove_red_eye_rounded,
//                       color: Colors.black,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Text("View Details"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             PopupMenuItem(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor:
//                   Theme.of(context).colorScheme.onSecondaryContainer,
//                   backgroundColor:
//                   Theme.of(context).colorScheme.secondaryContainer,
//                 ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (c) => EditScreen(id: id,)));
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.edit,
//                       color: Colors.black,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Text("Edit"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             PopupMenuItem(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor:
//                   Theme.of(context).colorScheme.onSecondaryContainer,
//                   backgroundColor:
//                   Theme.of(context).colorScheme.secondaryContainer,
//                 ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('all the chickens are in the coop')));
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.offline_bolt,
//                       color: Colors.black,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Text("Test Check"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
//
//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => false;
//
//   @override
//   // TODO: implement rowCount
//   int get rowCount => _listData.length;
//
//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => 0;
// }