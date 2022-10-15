import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_datatable_b01/models/item_model.dart';

//Cach dung DataTable binh thuong
class DataTableMockSecondEx extends StatelessWidget {
  const DataTableMockSecondEx({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  MyStatelessWidget({Key? key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  List<ItemModel> _listData = List.generate(
      200,
          (index) => ItemModel(id: index.toString(),title: "Item ${index}", price: Random().nextInt(10000)));
  List<ItemModel> usersFiltered = [];
  TextEditingController controller = TextEditingController();
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    usersFiltered = _listData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    // usersFiltered = _listData.where((user) => user.name.contains(_searchResult) || user.role.contains(_searchResult)).toList();
                    usersFiltered = _listData.where((element) => element.title.contains(_searchResult) || element.price.toString().contains(_searchResult)).toList();
                  });
                }),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  controller.clear();
                  _searchResult = '';
                  usersFiltered = _listData;
                });
              },
            ),
          ),
        ),
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Id',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Price',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List.generate(usersFiltered.length, (index) =>
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(usersFiltered[index].id)),
                  DataCell(Text(usersFiltered[index].title.toString())),
                  DataCell(Text(usersFiltered[index].price.toString())),
                ],
              ),
          ),
        ),
      ],
    );
  }
}