import 'package:flutter/material.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/constant.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/models/api_response.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/home.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/screens/login.dart';
import 'package:learn_flutter_blogapp_call_php_lar_api_b01/services/user_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserInfo() async {
      String token = await getToken();
      if(token == '') {
        //pushAndRemoveUtil: it removes the existing screens while route to another screen
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
            (route) => false
        );
      } else {
        ApiResponse response = await getUserDetail();
        if(response.error == null) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()),
                  (route) => false
          );
        } else if(response.error == unauthorized) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
                  (route) => false
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}'),),);
        }
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadUserInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(child: CircularProgressIndicator(),),
    );
  }
}
