import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String id;

  const EditScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState(id);
}

class _EditScreenState extends State<EditScreen> {
  final String id;

  _EditScreenState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
      ),
      body: Center(
        child: Column(
          children: [Text("Edit product have id ${id}")],
        ),
      ),
    );
  }
}
