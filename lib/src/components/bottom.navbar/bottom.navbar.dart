import 'package:flutter/material.dart';

import 'provider/navbar.dart';

class KBottomNavBar extends StatelessWidget {
  const KBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: BottomNavBarProvider.selected.index,
      onTap: (val) async => await BottomNavBarProvider.select(
        context: context,
        value: Screens.values[val],
      ),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: 'All',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi),
          label: 'Paid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_off),
          label: 'Unpaid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.signal_wifi_0_bar_rounded),
          label: 'All Unpaid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
