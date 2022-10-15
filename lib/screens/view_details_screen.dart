import 'package:flutter/material.dart';

class ViewDetailsScreen extends StatefulWidget {
  final String id;
  const ViewDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ViewDetailsScreen> createState() => _ViewDetailsScreenState(id);
}

class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
  final String id;

  _ViewDetailsScreenState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Details Screen'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text("View Details Screen of product have id ${id}"),
          ],
        ),
      ),
    );
  }
}
