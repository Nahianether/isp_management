import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/user/model/user.dart';

final textProvider = Provider.family((_, String __) {
  return TextEditingController();
});

typedef AddUserProvider = AutoDisposeNotifierProvider<AddUserNotifier, void>;

final addUserNotifier = AddUserProvider(AddUserNotifier.new);

class AddUserNotifier extends AutoDisposeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameCntrlr = TextEditingController();
  final TextEditingController phoneCntrlr = TextEditingController();
  final TextEditingController alterPhoneCntrlr = TextEditingController();
  final TextEditingController addressCntrlr = TextEditingController();
  final TextEditingController packageNameCntrlr = TextEditingController();
  final TextEditingController packagePriceCntrlr = TextEditingController();
  DateTime connectionDate = DateTime.now();

  @override
  void build() {}

  void changeDate(DateTime? date) {
    if (date == null) return;
    connectionDate = date;
    ref.notifyListeners();
  }

  Future<bool> saveUser() async {
    if (!formKey.currentState!.validate()) {
      debugPrint('Form is not valid');
      return false;
    } else {
      await User(
        fullName: nameCntrlr.text,
        phoneNumber: phoneCntrlr.text,
        alternativePhoneNumber: alterPhoneCntrlr.text,
        address: addressCntrlr.text,
        packageName: packageNameCntrlr.text,
        packagePrice: packagePriceCntrlr.text,
        connectionDate: connectionDate,
        paymentType: PaymentType.unPaid,
      ).save();
      return true;
    }
  }
}
