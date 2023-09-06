import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/constant.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtControllerBody = TextEditingController();
  bool _loading = false;
  File? _imageFile;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _createPost() async {
    String? image = _imageFile == null ? null : getStringImage(_imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new post'),
      ),
      body: _loading ? Center(child: CircularProgressIndicator(),) : ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.black38,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: _txtControllerBody,
                keyboardType: TextInputType.multiline,
                maxLines: 9,
                validator: (val) =>
                    val!.isEmpty ? "Post body is required" : null,
                decoration: InputDecoration(
                  hintText: "Post body...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black38),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: kTextButton("Post", () {
              setState(() {
                if(_formKey.currentState!.validate()) {
                  _loading = !_loading;
                }
              });
            }),
          ),
        ],
      ),
    );
  }
}
