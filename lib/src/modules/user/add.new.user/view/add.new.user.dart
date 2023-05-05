import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isp_management/src/db/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../components/app.bar/appbar.dart';
import '../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../components/text.field/text.field.provider.dart';
import '../../../../extensions/extensions.dart';
import '../../../../theme/themes/themes.dart';
import '../provider/add.new.user.dart';

class AddNewUser extends ConsumerWidget {
  const AddNewUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: 'Add New User'),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Name: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: ref.watch(textProvider('user_name')),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Name',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Phone: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: ref.watch(textProvider('user_phone')),
                      keyboardType: TextInputType.phone,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Phone',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Alternative Phone: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller:
                          ref.watch(textProvider('user_alternative_phone')),
                      keyboardType: TextInputType.phone,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Phone',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Address: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: ref.watch(textProvider('user_address')),
                      keyboardType: TextInputType.streetAddress,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Address',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Package Name: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: ref.watch(textProvider('user_package_name')),
                      decoration: inputDecoration.copyWith(
                        hintText: 'Package Name',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'User Package Price: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextFormField(
                      controller: ref.watch(textProvider('user_package_price')),
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration.copyWith(
                        hintText: 'Package Price',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Consumer(
                  builder: (_, ref, __) {
                    DateTime date = ref.watch(userConnectionDatePicker);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Connection Date: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: DateFormat('dd MMMM, yyyy').format(date),
                          ),
                          readOnly: true,
                          decoration: inputDecoration.copyWith(
                            hintText: 'Pick a date',
                            suffixIcon: InkWell(
                              onTap: () async {
                                ref
                                    .watch(userConnectionDatePicker.notifier)
                                    .state = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101),
                                ))!;
                              },
                              child: const Icon(Icons.calendar_month_rounded),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const KBottomNavBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          context.pop();
          final user = User(
            fullName: ref.watch(textProvider('user_name')).text,
            phoneNumber: ref.watch(textProvider('user_phone')).text,
            alternativePhoneNumber:
                ref.watch(textProvider('user_alternative_phone')).text,
            address: ref.watch(textProvider('user_address')).text,
            packageName: ref.watch(textProvider('user_package_name')).text,
            packagePrice: ref.watch(textProvider('user_package_price')).text,
            connectionDate: ref.read(userConnectionDatePicker),
            paymentType: PaymentType.unPaid,
          );
          await db.writeTxn(() => db.users.put(user));
          await clearAllField(ref);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}

clearAllField(ref) {
  ref.watch(textProvider('user_name')).clear();
  ref.watch(textProvider('user_phone')).clear();
  ref.watch(textProvider('user_alternative_phone')).clear();
  ref.watch(textProvider('user_address')).clear();
  ref.watch(textProvider('user_package_name')).clear();
  ref.watch(textProvider('user_package_price')).clear();
  ref.read(userConnectionDatePicker.notifier).state = DateTime.now();
}
