import 'package:flutter/material.dart';
import 'package:project_madbuah/helper_widget/botnavbar.dart';
import 'package:project_madbuah/pages/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Navbar();
                },
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "w.jpeg",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Color(0xffF2861E),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        label: Text('Nama Pengguna'),
                        floatingLabelStyle: TextStyle(color: Color(0xffF5591F)),
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Color(0xffF5591F),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                BorderSide(width: 2, color: Color(0xffF5591F))),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      cursorColor: Color(0xffF2861E),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          label: Text('Email'),
                          floatingLabelStyle:
                              TextStyle(color: Color(0xffF5591F)),
                          prefixIcon: Icon(Icons.email),
                          prefixIconColor: Color(0xffF5591F),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffF5591F)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      cursorColor: Color(0xffF2861E),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          label: Text('Sandi'),
                          floatingLabelStyle:
                              TextStyle(color: Color(0xffF5591F)),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Color(0xffF5591F),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffF5591F)))),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      cursorColor: Color(0xffF2861E),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        label: Text('Alamat'),
                        floatingLabelStyle: TextStyle(color: Color(0xffF5591F)),
                        prefixIcon: Icon(Icons.maps_home_work),
                        prefixIconColor: Color(0xffF5591F),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffF5591F)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffF2861E),
                            side: BorderSide.none,
                            shape: StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Ubah Profil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
