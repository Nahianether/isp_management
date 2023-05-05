import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../../components/app.bar/appbar.dart';
import '../../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../../constants/constants.dart';
import '../../../../../db/isar.dart';
import '../../../../../extensions/extensions.dart';
import '../../../../../theme/themes/themes.dart';
import '../../add.new.user/view/add.new.user.dart';
import '../../../user.details/view/user.details.dart';
import '../provider/all.user.provider.dart';

String dropdownValue = 'Paid';

class AllUserView extends StatelessWidget {
  const AllUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'All User List',
        isAllUser: true,
        allRecipents: recipents,
        message: message,
      ),
      body: const Body(),
      bottomNavigationBar: const KBottomNavBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          await context.push(const AddNewUser());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(userProvider);
    final notifier = ref.read(userProvider.notifier);
    final list = notifier.preferedUsers();
    return SizedBox(
      height: context.height,
      width: context.width,
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
                      // trailing: DropdownButton<String>(
                      //   value: dropdownValue,
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   iconSize: 24,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue!;
                      //     });
                      //   },
                      //   items: <String>['Paid', 'Unpaid']
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      trailing: user.paymentType == PaymentType.unPaid ||
                              user.paymentType == PaymentType.allUnPaid
                          ? IconButton(
                              icon: const Icon(Icons.payment_rounded),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PaymnetPopup(
                                      user: user,
                                    );
                                  },
                                );
                              },
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PaymnetPopup extends StatelessWidget {
  const PaymnetPopup({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    DateTime? picker;
    return AlertDialog(
      title: const Text('Payment Popup'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Paid Amount: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: user?.packagePrice),
            decoration: inputDecoration.copyWith(
              hintText: 'Amount',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: InkWell(
              onTap: () async {
                picker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
              },
              child: Text(
                DateFormat('dd MMMM, yyyy').format(picker ?? DateTime.now()),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            context.pop();
            user!.paymentType = PaymentType.paid;
            user!.billHistory = List.from(user!.billHistory ?? [])
              ..add(
                BillHistory(
                  billAmount: user!.packagePrice,
                  billPaidDate: picker ?? DateTime.now(),
                  monthOfBill: picker ?? DateTime.now(),
                ),
              );
            await db.writeTxn(() async => await db.users.put(user!));
          },
          child: const Text('Done'),
        )
      ],
    );
  }
}
