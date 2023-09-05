import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/constant.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/api_response.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/user.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/home.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/login.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool loading = false;

  void _registerUser() async{
    ApiResponse response = await register(nameController.text, emailController.text, passwordController.text);
    if(response.error == null) {
      _saveAndRedirectHome(response.data as User);
    }
    else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}')
      ));
    }
  }

  void _saveAndRedirectHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            TextFormField(
                controller: nameController,
                validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                decoration: kInputDecoration('Name')
            ),
            SizedBox(height: 20,),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
                decoration: kInputDecoration('Email')
            ),
            SizedBox(height: 20,),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Required at least 6 chars' : null,
                decoration: kInputDecoration('Password')
            ),
            SizedBox(height: 20,),
            TextFormField(
                controller: passwordConfirmController,
                obscureText: true,
                validator: (val) => val != passwordController.text ? 'Confirm password does not match' : null,
                decoration: kInputDecoration('Confirm password')
            ),
            SizedBox(height: 20,),
            loading ?
            Center(child: CircularProgressIndicator())
                : kTextButton('Register', () {
              if(formKey.currentState!.validate()){
                setState(() {
                  loading = !loading;
                  _registerUser();
                });
              }
            },
            ),
            SizedBox(height: 20,),
            kLoginRegisterHint('Already have an account? ', 'Login', (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
