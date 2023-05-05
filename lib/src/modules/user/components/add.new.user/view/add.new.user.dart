import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isp_management/src/db/isar.dart';
import 'package:isp_management/src/modules/user/model/user.dart';

import '../../../../../components/app.bar/appbar.dart';
import '../../../../../components/bottom.navbar/bottom.navbar.dart';
import '../../../../../components/text.field/text.field.provider.dart';
import '../../../../../extensions/extensions.dart';
import '../../../../../theme/themes/themes.dart';
import '../provider/add.new.user.dart';

class AddNewUser extends ConsumerWidget {
  const AddNewUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(addUserNotifier.notifier);
    return Scaffold(
      appBar: const CustomAppbar(title: 'Add New User'),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: notifier.formKey,
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
                        controller: notifier.nameCntrlr,
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
                        controller: notifier.phoneCntrlr,
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
                        controller: notifier.alterPhoneCntrlr,
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
                        controller: notifier.addressCntrlr,
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
                        controller: notifier.packageNameCntrlr,
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
                        controller: notifier.packagePriceCntrlr,
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
                      ref.watch(addUserNotifier);
                      DateTime date = notifier.connectionDate;
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
                                  notifier.changeDate(await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2015, 8),
                                    lastDate: DateTime(2101),
                                  ));
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
      ),
      bottomNavigationBar: const KBottomNavBar(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async =>
            await notifier.saveUser().then((r) => r ? context.pop() : null),
        child: const Icon(Icons.done),
      ),
    );
  }
}
