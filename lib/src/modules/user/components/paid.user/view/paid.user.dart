import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../../components/app.bar/appbar.dart';
import '../../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../../db/isar.dart';
import '../../../../../extensions/extensions.dart';
import '../../../user.details/view/user.details.dart';

class PaidUser extends ConsumerWidget {
  const PaidUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Paid User List'),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: StreamBuilder<List<User>>(
            stream: db.users
                .where()
                .filter()
                .paymentTypeEqualTo(PaymentType.paid)
                .watch(fireImmediately: true),
            builder: (context, snapshot) {
              if (snapshot.data?.isEmpty ?? true) {
                return const Center(
                  child: Text('No User Found'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  User? user = snapshot.data?[index];
                  return InkWell(
                    onTap: () async {
                      await context.push(
                        UserDetails(
                          user: user!,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Card(
                      child: ListTile(
                        title: Text(user?.fullName ?? ''),
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
                                Text(user?.phoneNumber ?? ''),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                Text(user?.address ?? ''),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
      bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
