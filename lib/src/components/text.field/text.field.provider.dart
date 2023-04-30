import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = Provider.family((_, String __) {
  return TextEditingController();
});