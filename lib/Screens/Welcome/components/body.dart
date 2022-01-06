import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size; //This is size provide us total hegiht and width of our screen
    return Background(
      child: SingleChildScrollView (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO PHUCDN APP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height* 0.5,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen() )
                );
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "SIGN-UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        }
                    )
                );
              },
            ),

          ],
        ),
      )


    );
  }
}


