import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_rating_app/screens/home_screen.dart';
import 'package:movie_rating_app/screens/profile_screen.dart';
import 'package:movie_rating_app/screens/save_screen.dart';
import 'package:movie_rating_app/screens/search_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar({super.key});

  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const SaveScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  final List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/save.svg",
    "assets/icons/search.svg",
    "assets/icons/profile.svg",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  Widget biuldIcon(String iconPath, bool isSelct) {
    return SvgPicture.asset(
      iconPath,
      width: 34,
      height: 34,
      color: isSelct ? Constants.mainColor : Constants.iconTurnOffColor,
    );
  }

  List<NavigationDestination> pagesMenu() {
    return List.generate(
      pages.length,
      (index) => NavigationDestination(
          icon: biuldIcon(icons[index], selectedIndex == index), label: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
            tabController.index = value;
          });
        },
        selectedIndex: selectedIndex,
        height: 71,
        indicatorColor: Constants.scaffoldBackgroundColor,
        backgroundColor: Constants.scaffoldBackgroundColor,
        destinations: pagesMenu(),
      ),
    );
  }
}
