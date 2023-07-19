import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../call.sms.function/multiple.sms.function.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.isAllUser = false,
    this.allRecipents,
    this.message,
    this.backButton = false,
  });

  final String title;
  final bool isAllUser;
  final List<String>? allRecipents;
  final String? message;
  final bool backButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String now = DateFormat('dd MMMM, yyyy').format(DateTime.now());
    return AppBar(
      automaticallyImplyLeading: backButton == true ? true : false,
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

                  await sendSMSAll(allRecipents ?? [], message1);
                },
                icon: const Icon(Icons.messenger_rounded),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
