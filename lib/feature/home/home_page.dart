import 'dart:io';

import 'package:animage/constant.dart';
import 'package:animage/dimension.dart';
import 'package:animage/feature/favorite/favorite_page.dart';
import 'package:animage/feature/gallery/gallery_page.dart';
import 'package:animage/feature/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _HomePageIOS() : _HomePageAndroid();
  }
}

class _HomePageAndroid extends StatefulWidget {
  const _HomePageAndroid();

  @override
  State<_HomePageAndroid> createState() => _HomePageAndroidState();
}

class _HomePageAndroidState extends State<_HomePageAndroid> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const GalleryPage(),
          const FavoritePage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Gallery',
            tooltip: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            tooltip: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            tooltip: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: brandColor,
        unselectedItemColor: isDark ? grey217 : grey189,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTabSelected,
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class _HomePageIOS extends StatefulWidget {
  const _HomePageIOS();

  @override
  State<_HomePageIOS> createState() => _HomePageIOSState();
}

class _HomePageIOSState extends State<_HomePageIOS> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const GalleryPage(),
      const FavoritePage(),
      const SettingsPage(),
    ];
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    Color selectedColor = isDark ? brandColorDark : brandColor;

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: selectedColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: space3),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill, size: space3),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.info_circle_fill, size: space3),
              label: 'About',
            ),
          ],
        ),
        tabBuilder: (context, int index) {
          return tabs[index];
        },
      ),
    );
  }
}
