import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:l_flutter_login_netcore_api5_ui/providers/user_provider.dart';
import 'package:l_flutter_login_netcore_api5_ui/widgets/input_decoration.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            headingBanner(size),
            iconHeadrer(),
            loginFrom(context),
          ],
        ),
      ),
    );
  }

  SafeArea iconHeadrer() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container headingBanner(Size size) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      width: double.infinity,
      height: size.height * .4,
      child: Stack(
        children: [
          Positioned(
            child: ovalDesign(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: ovalDesign(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: ovalDesign(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: ovalDesign(),
            bottom: -50,
            right: 10,
          ),
          Positioned(
            child: ovalDesign(),
            top: 120,
            left: -20,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView loginFrom(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // userProvider.getListUsers();
    var txtUsername = TextEditingController();
    var txtPassword = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: double.infinity,
            // height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtUsername,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecorations.inputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                              icon: Icon(Icons.email_rounded)),
                          validator: (value){
                            String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp= new RegExp(pattern);
                            return regExp.hasMatch(value ?? "") ? null : "The email not match with the format case";
                          },

                          // const InputDecoration(
                          //   enabledBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurple),
                          //   ),
                          //   focusedBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color: Colors.deepPurple,
                          //       width: 2,
                          //     ),
                          //   ),
                          //   hintText: "Username",
                          //   labelText: "Username",
                          //   prefixIcon: Icon(Icons.alternate_email_rounded),
                          // ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: txtPassword,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecorations.inputDecoration(
                              hintText: "*******",
                              labelText: "Password",
                              icon: Icon(Icons.lock_outline)),
                          validator: (value) {
                            return (value != null && value.length >=6) ? null :
                                "Password must have 6 characters";
                          },

                          // const InputDecoration(
                          //   enabledBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurple),
                          //   ),
                          //   focusedBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(
                          //       color: Colors.deepPurple,
                          //       width: 2,
                          //     ),
                          //   ),
                          //   hintText: "******",
                          //   labelText: "Password",
                          //   prefixIcon: Icon(Icons.lock_outline),
                          // ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            // Navigator.pushReplacementNamed(context, "home");
                            print(userProvider.listUser);
                            var users = userProvider.listUser;
                            if(users.where((e) => e.username == txtUsername.text).length > 0 &&
                              users.where((e) => e.password == txtPassword.text).length > 0
                            ){
                              Navigator.pushReplacementNamed(context, "home");
                            } else {
                              print("Failed");
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledColor: Colors.grey,
                          color: Colors.deepPurple,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 15,
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Create new user for this systtem",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container ovalDesign() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
