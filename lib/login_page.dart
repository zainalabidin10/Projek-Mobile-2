import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_madbuah/helper_widget/botnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:project_madbuah/register_page.dart';
import 'package:project_madbuah/splash_screen.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  List result = [];

  @override
  Future<void> _login() async {
    Uri url = Uri.parse(
        "http://192.168.1.26/api/login.php?username=${userNameController.text.toString()}&password=${passwordController.text.toString()}");
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    if (data.toString() == "berhasil") {
      Fluttertoast.showToast(
          msg: "Berhasil Login",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    } else {
      Fluttertoast.showToast(
          msg: "Username atau Password salah",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color(0xffF5591F),
                gradient: LinearGradient(
                  colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/Madbuah.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "login".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: userNameController,
                        cursorColor: Color(0xffF5591F),
                        decoration: const InputDecoration(
                          labelText: 'Nama Pengguna',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color(0xffF5591F),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Color(0xffF5591F),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            'login'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        // onPressed: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) {
                        //         return Navbar();
                        //       },
                        //     ),
                        //   );
                        // },
                        onPressed: () async {
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            sharedPref.setBool(
                                SplashScreenState.KEYLOGIN, true);
                            _login();
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Belum punya akun? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Daftar Sekarang",
                              style: TextStyle(color: Color(0xffF5591F)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
