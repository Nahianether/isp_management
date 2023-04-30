import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/app.bar/appbar.dart';
import '../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../components/call.sms.function/single.call.sms.function.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: 'User Details'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Abdur Rahman Kaderi',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.phone,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                      '+880-1724324832',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await makePhoneCall('+880-1724324832');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.call,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          await sendSMS(
                              '+880-1724324832', 'This is a test message!');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.message,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text('Kashinathpur',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
                const Text('Package Name: 1 Mbps'),
                const Text('Package Price: 500'),
                const Text('Connection Date: 2021-01-01'),
                Table(
                  children: const [
                    TableRow(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Month of Bill',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Bill Amount',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Bill Paid Date',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Table(
                  border: TableBorder.all(),
                  children: List.generate(
                    10,
                    (index) => const TableRow(
                      children: [
                        Center(child: Text('January-2023')),
                        Center(child: Text('500')),
                        Center(child: Text('2021-01-01')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
