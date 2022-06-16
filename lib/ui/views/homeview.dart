import 'package:flutter/material.dart';
import 'package:livescore_app/core/View_models/homeviewmodel.dart';
import 'package:livescore_app/core/list/screenlist.dart';
import 'package:provider/provider.dart';

class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index = Provider.of<HomeviewModel>(context).index;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.sports_soccer),
        title: const Text("Football"),
      ),
      body: screen.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            Provider.of<HomeviewModel>(context, listen: false).tabswitch(value);
          },
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "All Leagues",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              label: "Live",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }
}
