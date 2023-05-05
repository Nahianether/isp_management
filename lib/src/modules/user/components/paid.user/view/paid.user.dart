import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../../components/app.bar/appbar.dart';
import '../../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../../db/isar.dart';
import '../../../../../extensions/extensions.dart';
import '../../../user.details/view/user.details.dart';
import '../../all.user/provider/all.user.provider.dart';

class PaidUser extends StatelessWidget {
  const PaidUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: 'Paid User List'),
      body: Body(),
      bottomNavigationBar: KBottomNavBar(),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userProvider);
    final notifier = ref.read(userProvider.notifier);
    final list = notifier.preferedUsers(PaymentType.paid);
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: TextFormField(
              controller: notifier.searchCntrlr,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search User',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Flexible(
            child: list.isEmpty
                ? const Center(child: Text('No User Found'))
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      User? user = list[index];
                      return InkWell(
                        onTap: () async =>
                            await context.push(UserDetails(user: user)),
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          child: ListTile(
                            title: Text(user.fullName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(user.phoneNumber),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: Colors.grey,
                                    ),
                                    Text(user.address),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
