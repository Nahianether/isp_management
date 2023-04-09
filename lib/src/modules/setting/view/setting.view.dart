import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        child: CustomAppbar(title: 'Setting'),
      ),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final theme = ref.watch(themeProvider);
            return ElevatedButton(
              onPressed: () async =>
                  await ref.read(themeProvider.notifier).toggleTheme(),
              child: theme == ThemeProfile.dark
                  ? const Text('Change Theme to Light')
                  : const Text('Change Theme to Dark'),
            );
          },
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
