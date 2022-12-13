import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_madbuah/helper_widget/botnavbar.dart';
import 'package:project_madbuah/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();

    var isLogeedIn = sharePref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 4), () {
      if (isLogeedIn != null) {
        if (isLogeedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Navbar()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xffF5591F),
                gradient: LinearGradient(
                    colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: Container(
              child: Image.asset(
                "assets/Madbuah.png",
                width: 400,
                height: 400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
