import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../components/app.bar/appbar.dart';
import '../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../extensions/extensions.dart';
import '../../../theme/themes/themes.dart';

class AddNewUser extends ConsumerWidget {
  const AddNewUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String now = DateFormat('dd MMMM, yyyy').format(DateTime.now());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: 'Add New User'),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Column(
              children: [
                const Text('User Name'),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Name',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('User Phone'),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Phone',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('User Address'),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Address',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('User Package Name'),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Package Name',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Connection Date'),
                Row(
                  children: [
                    Text(now),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pop();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
