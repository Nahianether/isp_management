import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                onPressed: () async {},
                icon: const Icon(Icons.message),
              )
            : const SizedBox.shrink(),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
