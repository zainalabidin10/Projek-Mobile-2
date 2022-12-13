import 'package:flutter/material.dart';
import 'package:project_madbuah/helper_widget/botnavbar.dart';
import 'package:project_madbuah/pages/shopping_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kategori',
            style: TextStyle(color: Colors.black),
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
        body: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              width: 120,
              height: 120,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShoppingPage2();
                        },
                      ),
                    );
                  },
                  child: Image.asset('icons/apple.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              width: 120,
              height: 120,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShoppingPage2();
                        },
                      ),
                    );
                  },
                  child: Image.asset('icons/fruit.png'),
                ),
              ),
            )
          ],
        ));
  }
}
