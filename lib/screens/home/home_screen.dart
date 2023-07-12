import 'package:covoiturage/constants/app_colors.dart';
import 'package:covoiturage/screens/home/profile_screen.dart';
import 'package:covoiturage/screens/home/publish_screen.dart';
import 'package:covoiturage/screens/home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = const [
    Icon(
      Icons.search,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.publish_sharp,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   title: const Text('Curved Navigation Bar'),
      //   backgroundColor: Colors.transparent,
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 50,
        color: AppColors.secondaryColor,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const SearchScreen();
        break;
      case 1:
        widget = const PublishScreen();
        break;
      case 2:
        widget = const ProfileScreen();
        break;
      default:
        widget = const SearchScreen();
        break;
    }
    return widget;
  }
}
