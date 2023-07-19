import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../components/app.bar/appbar.dart';
import '../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../theme/model/theme.model.dart';
import '../../../theme/provider/theme.provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppbar(
            title: 'Settings',
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Divider(),
                Consumer(
                  builder: (_, ref, __) {
                    final theme = ref.watch(themeProvider);
                    return ListTile(
                      title: const Text('Change Theme: '),
                      trailing: ElevatedButton(
                        onPressed: () async => await ref
                            .read(themeProvider.notifier)
                            .toggleTheme(),
                        child: theme == ThemeProfile.dark
                            ? const Text('Change to Light')
                            : const Text('Change to Dark'),
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            ),
            Column(
              children: [
                const Divider(),
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    return ListTile(
                      title: const Text('Application Version: '),
                      trailing: Text(
                        snapshot.hasData ? snapshot.data!.version : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
