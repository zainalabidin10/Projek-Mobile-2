import 'package:flutter/material.dart';
import 'package:project_madbuah/helper_widget/botnavbar.dart';
import 'package:project_madbuah/login_page.dart';
import 'package:project_madbuah/pages/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Kristopher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'kristopherbeethoven24@gmail.com',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10.0,
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
                        return EditProfilePage();
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
            const SizedBox(
              height: 20.0,
            ),
            Divider(),
            const SizedBox(
              height: 10.0,
            ),
            ProfileMenuWidget(
              title: "Akun Saya",
              icon: Icons.person,
              onPress: () {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ProfileMenuWidget(
              title: "Alamat Saya",
              icon: Icons.location_city,
              onPress: () {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ProfileMenuWidget(
              title: "Privasi dan Kebijakan",
              icon: Icons.lock,
              onPress: () {},
            ),
            Divider(),
            const SizedBox(
              height: 10.0,
            ),
            ProfileMenuWidget(
              title: "Keluar",
              icon: Icons.logout_outlined,
              textColor: Colors.red,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xffF2861E).withOpacity(0.1)),
        child: Icon(
          icon,
          color: Color(0xfff2861E),
        ),
      ),
      title: Text(title),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
