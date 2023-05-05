import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../../db/isar.dart';
import '../../../model/user.dart';

final usersStream =
    StreamProvider((_) => db.users.where().watch(fireImmediately: true));

final usersFutureProvider = FutureProvider<List<User>>((ref) async {
  ref.watch(usersStream);
  return await db.users.where().findAll();
});

typedef UserProvider = NotifierProvider<UserNotifier, List<User>>;

final userProvider = UserProvider(UserNotifier.new);

class UserNotifier extends Notifier<List<User>> {
  TextEditingController searchCntrlr = TextEditingController();

  @override
  List<User> build() {
    listener();
    return ref.watch(usersFutureProvider).value ?? [];
  }

  listener() => searchCntrlr.addListener(() => ref.notifyListeners());

  List<User> preferedUsers([PaymentType? paymentType]) {
    final list = state
        .where((e) =>
            e.phoneNumber
                .toLowerCase()
                .contains(searchCntrlr.text.toLowerCase()) ||
            e.fullName.toLowerCase().contains(searchCntrlr.text.toLowerCase()))
        .toList();
    if (paymentType == null) return list;
    if (paymentType == PaymentType.paid) {
      return list.where((e) => e.paymentType == PaymentType.paid).toList();
    } else if (paymentType == PaymentType.unPaid) {
      return list.where((e) => e.paymentType == PaymentType.unPaid).toList();
    } else if (paymentType == PaymentType.allUnPaid) {
      return list.where((e) => e.paymentType == PaymentType.unPaid).toList();
    } else {
      return list;
    }
  }
}


// 1 ta class create  => AbcNotifier

// arelkta access korte hobe => abcProvider

// type => AbcProvider
