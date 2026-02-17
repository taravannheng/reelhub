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
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withAlpha(100),
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomIcon(
                path: CustomIcons.home,
                color: Theme.of(
                  context,
                ).bottomNavigationBarTheme.unselectedIconTheme?.color,
              ),
              activeIcon: CustomIcon(path: CustomIcons.homeSolid),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(path: CustomIcons.magnifyingGlass,
                color: Theme.of(
                  context,
                ).bottomNavigationBarTheme.unselectedIconTheme?.color,),
              activeIcon: CustomIcon(path: CustomIcons.magnifyingGlassSolid),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(path: CustomIcons.profile,
                color: Theme.of(
                  context,
                ).bottomNavigationBarTheme.unselectedIconTheme?.color,),
              activeIcon: CustomIcon(path: CustomIcons.profileSolid),
              label: 'Profile',
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
          selectedFontSize: 12.0,
        ),
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
