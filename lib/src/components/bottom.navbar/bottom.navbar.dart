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
          icon: Icon(Icons.network_wifi_rounded),
          label: 'Paid',
        ),
        BottomNavigationBarItem(
          icon:
              Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_rounded),
          label: 'Unpaid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
