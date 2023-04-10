import 'package:flutter/widgets.dart';
import '../../../extensions/extensions.dart';

import '../../../modules/user/all.user/view/all.user.view.dart';
import '../../../modules/user/paid.user/view/paid.user.dart';
import '../../../modules/setting/view/setting.view.dart';
import '../../../modules/user/un.paid.user/view/un.paid.user.dart';

class BottomNavBarProvider {
  static Screens selected = Screens.one;

  static Widget _screen() {
    switch (selected) {
      case Screens.one:
        return const AllUserView();
      case Screens.two:
        return const PaidUser();
      case Screens.three:
        return const UnPaidUser();
      case Screens.four:
        return const SettingView();
      default:
        return const AllUserView();
    }
  }

  static Widget get screen => _screen();

  static Future<void> select(
      {required BuildContext context, required Screens value}) async {
    selected = value;
    await context.pushReplacement(screen);
  }
}

enum Screens { one, two, three, four }
