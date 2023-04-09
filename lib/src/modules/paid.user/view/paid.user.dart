import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isp_management/src/extensions/extensions.dart';

import '../../../components/app.bar/appbar.dart';
import '../../../components/bottom.navbar/bottom.navbar.dart';
import '../../user.details/view/user.details.dart';

class PaidUser extends ConsumerWidget {
  const PaidUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: 'Paid User List'),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                await context.push(const UserDetails());
              },
              borderRadius: BorderRadius.circular(10),
              child: Card(
                child: ListTile(
                  title: Text('Abdur Rahman Kaderi$index'),
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
                          Text('+880-172432483$index'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Text('Kashinathpur$index'),
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
      bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
