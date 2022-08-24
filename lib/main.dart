import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TreeController treeController = TreeController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tree View Example",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tree View Example"),
          actions: [
            IconButton(
              onPressed: () {
                treeController.collapseAll();
                setState(() {

                });
              },
              icon: Icon(Icons.expand_less),
            ),
            IconButton(
              onPressed: () {
                treeController.expandAll();
                setState(() {

                });
              },
              icon: Icon(Icons.expand_more),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          color: Colors.yellowAccent[100],
          child: TreeView(
            treeController: treeController,
            iconSize: 30,
            indent: 10,
            nodes: [
              TreeNode(
                content: const Text(
                  "Book Content",
                  style: TextStyle(fontSize: 20),
                ),
                children: [
                  TreeNode(
                    content: const Text(
                      "Introduction",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TreeNode(
                    content: const Text(
                      "Layout",
                      style: TextStyle(fontSize: 17),
                    ),
                    children: [
                      TreeNode(
                        content: const Text(
                          "Row Widget",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      TreeNode(
                        content: const Text(
                          "Collumn Widget",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
