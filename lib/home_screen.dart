import 'package:flutter/material.dart';
import 'package:movies_app/tabs/explore_tab.dart';
import 'package:movies_app/tabs/home_tab.dart';
import 'package:movies_app/tabs/profile_tab.dart';
import 'package:movies_app/tabs/search_tab.dart';

import 'app_colors/app_images.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.homeIcon)), label: ""),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.searchIcon)),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.exploreIcon)),
                    label: ""),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.profileIcon)),
                    label: ""),
              ]),
        ));
  }

  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];
}
