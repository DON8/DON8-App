import 'package:don8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  final List<Widget> _screens = [
    MapScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  TabController _tabBarController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    _tabBarController = TabController(
      length: _screens.length,
      vsync: this,
      initialIndex: 1,
    );

    _tabBarController.addListener(() {
      _selectedIndex = _tabBarController.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      initialIndex: 1,
      child: Scaffold(
        body: TabBarView(
          controller: _tabBarController,
          children: _screens,
        ),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }

  Container bottomNavBar() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      child: TabBar(
        controller: _tabBarController,
        onTap: (i) {
          _selectedIndex = i;
          setState(() {});
        },
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(color: Colors.white),
        tabs: [
          mapTab(),
          homeTab(),
          profileTab(),
        ],
      ),
    );
  }

  Tab profileTab() {
    return Tab(
      child: Column(
        children: [
          _selectedIndex == 2 ? Icon(Icons.person) : Icon(Icons.person_outline),
          Text(
            "Profile",
            style: TextStyle(
              fontWeight:
                  _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
              fontFamily: "RobotoCondensed",
            ),
          )
        ],
      ),
    );
  }

  Tab homeTab() {
    return Tab(
      child: Column(
        children: [
          Image.asset(
            "assets/home_logo.png",
            width: 20,
          ),
          Text(
            "Home",
            style: TextStyle(
              fontWeight:
                  _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
              fontFamily: "RobotoCondensed",
            ),
          )
        ],
      ),
    );
  }

  Tab mapTab() {
    return Tab(
      child: Column(
        children: [
          _selectedIndex == 0
              ? Icon(Icons.location_on)
              : Icon(OMIcons.locationOn),
          Text(
            "Map",
            style: TextStyle(
              fontWeight:
                  _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
              fontFamily: "RobotoCondensed",
            ),
          )
        ],
      ),
    );
  }
}
