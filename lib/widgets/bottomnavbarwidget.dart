import 'package:akumusicplayer/controller/wishlstcontroller.dart';
import 'package:akumusicplayer/view/homescreen.dart';
import 'package:akumusicplayer/view/localstoragemusicscreen.dart';
import 'package:akumusicplayer/view/wishlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottomnavbarwidget extends StatefulWidget {
  const Bottomnavbarwidget({Key? key}) : super(key: key);

  @override
  State<Bottomnavbarwidget> createState() => _BottomnavbarwidgetState();
}

class _BottomnavbarwidgetState extends State<Bottomnavbarwidget> {
  final pages = [
    Localstoragemusicscreen(),
    Homescreen(),
    Wishlistscreen(),
  ];

  int selectedIndex = 1;

  final SongWishlistController songWishlistController =
      Get.put(SongWishlistController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: const Color.fromARGB(255, 53, 54, 53),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 97, 94, 96),
        selectedFontSize: 18,
        unselectedFontSize: 15,
        onTap: (newindex) {
          setState(() {
            selectedIndex = newindex;
            if (newindex == 2) {
              songWishlistController.getDatawishlest();
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.storage), label: "local storage"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorite"),
        ],
      ),
    );
  }
}
