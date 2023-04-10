import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../call.sms.function/multiple.sms.function.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key, required this.title, this.isAllUser = false});

  final String title;
  final bool isAllUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String now = DateFormat('dd MMMM, yyyy').format(DateTime.now());
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          Text(
            now,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        isAllUser == true
            ? IconButton(
                onPressed: () async {
                  String message1 = 'This is a test message!';
                  List<String> recipents = [
                    '+8801610468492',
                    '+8801647629698',
                    '+8801724324832',
                    '+8801734522557',
                    '+8801962823007',
                    '+8801972823009',
                    '+8801982823010',
                    '+8801992823011',
                    '+8801992823012',
                    '+8801992823013',
                    '+8801992823014',
                    '+8801992823015',
                    '+8801992823016',
                    '+8801992823017',
                    '+8801992823018',
                    '+8801992823019',
                    '+8801992823020',
                    '+8801992823021',
                    '+8801992823022',
                    '+8801992823023',
                    '+8801992823024',
                    '+8801992823025',
                    '+8801992823026',
                    '+8801992823027',
                    '+8801992823028',
                    '+8801992823029',
                    '+8801992823030',
                    '+8801992823031',
                    '+8801992823032',
                    '+8801992823033',
                    '+8801992823034',
                    '+8801992823035',
                    '+8801992823036',
                    '+8801992823037',
                    '+8801992823038',
                    '+8801992823039',
                    '+8801992823040',
                    '+8801992823041',
                    '+8801992823042',
                    '+8801992823043',
                    '+8801992823044',
                    '+8801992823045'
                  ];
                  await sendSMSAll(recipents, message1);
                },
                icon: const Icon(Icons.messenger_rounded),
              )
            : const SizedBox.shrink(),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
