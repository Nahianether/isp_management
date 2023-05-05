import 'package:isar/isar.dart';

import '../../../db/isar.dart';

part 'user.g.dart';
part 'user.db.ext.dart';

@Collection()
class User {
  Id id = DateTime.now().microsecondsSinceEpoch;

  String fullName;
  String phoneNumber;
  String? alternativePhoneNumber;
  String address;
  String packageName;
  String packagePrice;
  DateTime connectionDate;


  List<BillHistory>? billHistory;


  @Index()
  @enumerated
  PaymentType paymentType;

  User({
    required this.fullName,
    required this.phoneNumber,
    this.alternativePhoneNumber,
    required this.address,
    required this.packageName,
    required this.packagePrice,
    required this.connectionDate,
    required this.paymentType,
    this.billHistory,
  });
}

@embedded
class BillHistory {
  DateTime? monthOfBill;
  String? billAmount;
  DateTime? billPaidDate;

  BillHistory({
    this.monthOfBill,
    this.billAmount,
    this.billPaidDate,
  });
}

enum PaymentType {
  paid(0),
  unPaid(1),
  allUnPaid(2);

  const PaymentType(this.value);
  final int value;
}
