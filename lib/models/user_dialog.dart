import 'package:flutter/material.dart';
import 'package:learn_dynamic_list_b01/models/user.dart';

class AddUserDialog extends StatefulWidget {
  // const AddUserDialog({Key? key}) : super(key: key);

  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneNoController = TextEditingController();

    Widget buildTextField(String hint, TextEditingController edtController) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: edtController,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .35,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Add User",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),

            //edt Text
            buildTextField("Username", usernameController),
            buildTextField("Email", emailController),
            buildTextField("Phone No", phoneNoController),

            //add button
            ElevatedButton(
              onPressed: () {
                final user = User(
                  usernameController.text,
                  emailController.text,
                  phoneNoController.text,
                );

                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
