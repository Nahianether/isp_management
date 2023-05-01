import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isp_management/src/extensions/extensions.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../components/app.bar/appbar.dart';
import '../../../../components/call.sms.function/single.call.sms.function.dart';
import '../../../../components/text.field/text.field.provider.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: 'User Details', backButton: true),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                      user.phoneNumber,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Alternative Phone Number:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 14,
                          color: Colors.grey,
                        ),
                        Text(
                          user.alternativePhoneNumber ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
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
                          await makePhoneCall(user.phoneNumber);
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Send SMS'),
                                  content: TextFormField(
                                    controller:
                                        ref.watch(textProvider('send_sms')),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your message',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await sendSMS(
                                            user.phoneNumber,
                                            ref
                                                .watch(textProvider('send_sms'))
                                                .text);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                );
                              });
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
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                      user.address,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.pages,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text('Package Name: ${user.packageName}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.currency_exchange_rounded,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text('Package Price: ${user.packagePrice}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.data_thresholding_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                        'Connection Date: ${DateFormat('dd MMMM, yyyy').format(user.connectionDate)}'),
                  ],
                ),
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
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  children: List.generate(
                    user.billHistory?.length ?? 0,
                    (index) => TableRow(
                      children: [
                        Center(
                          child: Text(DateFormat('MMMM, yyyy')
                              .format(user.billHistory![index].monthOfBill!)),
                        ),
                        Center(
                          child: Text(user.billHistory![index].billAmount!),
                        ),
                        Center(
                          child: Text(DateFormat('dd MMMM, yyyy')
                              .format(user.billHistory![index].billPaidDate!)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const KBottomNavBar(),
    );
  }
}
