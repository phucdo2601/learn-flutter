import 'package:flutter/widgets.dart';
import 'package:l_flutter_login_netcore_api5_ui/constants.dart';
import 'package:l_flutter_login_netcore_api5_ui/models/user.dart';
import 'package:http/http.dart' as http;

const urlApi = url;

class UserProvider with ChangeNotifier {
  List<User> listUser =  [];

  UserProvider(){
    getListUsers();
  }

  getListUsers() async {

    // final url1 = Uri.https(urlApi, "api/User");
    // final resp = await http.get(url1, headers: {
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Credentials": "true",
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    // });
    // final response = userFromJson(resp.body);
    // listUser = response;
    // print(listUser);
    // notifyListeners();

    var client = http.Client();
    var url1 = Uri.parse(
        'https://learnflutterwithaspnetapi20220408003613.azurewebsites.net/api/Student');

    var response = await client.get(url1);

    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      listUser =  userFromJson(json);
      notifyListeners();
    }
  }
}