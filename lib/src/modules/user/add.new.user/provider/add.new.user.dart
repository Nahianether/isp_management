import 'package:flutter_riverpod/flutter_riverpod.dart';

final userConnectionDatePicker = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);
