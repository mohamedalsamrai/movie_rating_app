import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_rating_app/screens/home_screen.dart';
import 'package:movie_rating_app/screens/profile_screen.dart';
import 'package:movie_rating_app/screens/save_screen.dart';
import 'package:movie_rating_app/screens/search_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';

/*
  It's important to use speaking names and make our code as self-documenting
  as we can, so that whoever works with this codebase (even ourselves) can
  get immediately a better idea of what happens.
  
  BottomNavScreen is more of a speaking name than MenuTabBar.
*/
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _selectedIndex = 0;

  // This is used only here, so let's make it private prefixing _.
  final List<Widget> _pages = [
    const HomeScreen(),
    const SaveScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  final List<String> _icons = [
    "assets/icons/home.svg",
    "assets/icons/save.svg",
    "assets/icons/search.svg",
    "assets/icons/profile.svg",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
  }
  
  Widget _buildIcon(String iconPath, bool isSelected) => SvgPicture.asset(
    iconPath,
    width: Dimens.getAppDimens(context).bottomNavigationIconSize,
    height: Dimens.getAppDimens(context).bottomNavigationIconSize,
    colorFilter: ColorFilter.mode( // "color" property is deprecated.
      isSelected ? Constants.mainColor : Constants.iconTurnOffColor,
      BlendMode.srcIn,
    ),
  );

  // _generateBottomNavItems is more of a speaking name than pagesMenu().
  List<NavigationDestination> _generateBottomNavItems() {
    return List.generate(
      _pages.length,
      (index) => NavigationDestination(
        icon: _buildIcon(_icons[index], false),
        selectedIcon: _buildIcon(_icons[index], true),
        label: ''
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
            _tabController.index = value;
          });
        },
        selectedIndex: _selectedIndex,
        height: Dimens.getAppDimens(context).bottomNavigationHeight,
        indicatorColor: Constants.scaffoldBackgroundColor,
        backgroundColor: Constants.scaffoldBackgroundColor,
        destinations: _generateBottomNavItems(),
      ),
    );
  }
}
