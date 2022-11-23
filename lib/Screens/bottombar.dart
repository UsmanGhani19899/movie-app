import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nuplex/Screens/home.dart';
import 'package:nuplex/Screens/profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

int _selectedIndex = 0;
TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white);
List<Widget> _widgetOptions = <Widget>[
  Home(),
  Text(
    'Search',
    style: optionStyle,
  ),
  Text(
    'Search',
    style: optionStyle,
  ),
  Profile()
];

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: HexColor('#d44040'),
              color: Colors.grey,
              tabs: [
                GButton(
                  icon: FeatherIcons.video,
                  text: 'Home',
                ),
                GButton(
                  icon: FeatherIcons.search,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.receipt,
                  text: 'Search',
                ),
                GButton(
                  icon: FeatherIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
