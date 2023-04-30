import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';
import '../../../../constants/constants.dart';
import '../../../../db/isar.dart';
import '../../../../extensions/extensions.dart';

import '../../../../components/app.bar/appbar.dart';
import '../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../user.details/view/user.details.dart';

class TotalUnPaidUser extends ConsumerWidget {
  const TotalUnPaidUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
            title: 'All UnPaid User List',
            isAllUser: true,
            allRecipents: recipents,
            message: message),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: StreamBuilder<List<User>>(
            stream: db.users
                .where()
                .filter()
                .paymentTypeEqualTo(PaymentType.unPaid)
                .watch(fireImmediately: true),
            builder: (context, snapshot) {
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
