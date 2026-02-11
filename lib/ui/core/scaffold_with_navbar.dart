import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reelhub/ui/core/custom_icon.dart';
import 'package:reelhub/utils/constants/icon_constants.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CustomIcon(path: CustomIcons.home),
            activeIcon: CustomIcon(
              path: CustomIcons.homeSolid,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(path: CustomIcons.magnifyingGlass),
            activeIcon: CustomIcon(
              path: CustomIcons.magnifyingGlassSolid,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(path: CustomIcons.profile),
            activeIcon: CustomIcon(
              path: CustomIcons.profileSolid,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
        selectedFontSize: 12.0,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
