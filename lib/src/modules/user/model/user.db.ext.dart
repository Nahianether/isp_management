part of 'user.dart';

extension UserDBExt on User {
  Future<void> save([bool isSilent = false]) async =>
      await db.writeTxn(() async => await db.users.put(this), silent: isSilent);
}

extension UserDBExtList on List<User> {
  Future<void> saveAll([bool isSilent = false]) async => await db
      .writeTxn(() async => await db.users.putAll(this), silent: isSilent);
}
