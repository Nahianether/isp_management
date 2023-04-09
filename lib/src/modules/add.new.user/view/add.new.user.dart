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
                    decoration: inputDecoration.copyWith(
                      hintText: 'Package Price',
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
                    'Connection Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: inputDecoration.copyWith(
                      hintText: 'Pick a date',
                      suffixIcon: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            String now =
                                DateFormat('dd MMMM, yyyy').format(picked);
                            print('Date: $now');
                          }
                        },
                        child: const Icon(Icons.calendar_month_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
