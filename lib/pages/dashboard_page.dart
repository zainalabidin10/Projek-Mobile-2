import 'package:flutter/material.dart';
import 'package:project_madbuah/pages/category.dart';
import 'package:project_madbuah/pages/search_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _cardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                            color: Color(0xffF2861E),
                            iconSize: 30,
                          ),
                        ),
                        Column(
                          children: [
                            Text("Selamat Datang!"),
                            Text("Mari Berbelanja!")
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SearchPage();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF2861E)),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              width: 500,
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _cardController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        "Madbuah.png",
                        fit: BoxFit.contain,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Segera Hadir!',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SmoothPageIndicator(
              controller: _cardController,
              count: 2,
              effect: ExpandingDotsEffect(activeDotColor: Color(0xffF2861E)),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Kategori",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CategoryPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Lihat Semua >",
                          style: TextStyle(color: Color(0xffF2861E)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade100),
                            child: Center(
                              child: Image.asset('icons/apple.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Buah',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade100),
                            child: Center(
                              child: Image.asset('icons/fruit.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Parcel',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Semua Buah",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lihat Semua >',
                          style: TextStyle(color: Color(0xffF2861E)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.purple[100],
                        child: Column(
                          children: const [Text('Apel'), Text('Banana')],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
