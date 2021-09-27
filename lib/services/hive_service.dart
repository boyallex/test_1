import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class HiveFile { 
  @HiveField(0)
  HiveFile();

  Future<void> write(String? uid) async {
    final box = await Hive.openBox<String>("uid");
    box.put("uid", uid!);
  }
  Future<String?> read({String? key}) async {
    final box = await Hive.openBox<String>("uid");
    return box.get("uid");
  }
}