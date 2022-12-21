import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'homePahe.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var index = 0;
  final page = [
    MainPage(),
    ProductsPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: page[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.category, size: 30), label: "Categorys"),
          NavigationDestination(
              icon: Icon(Icons.phonelink_rounded, size: 30), label: "Praducts"),
        ],
      ),
    );
  }
}
