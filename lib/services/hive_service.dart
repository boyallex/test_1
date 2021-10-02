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
  Future<String?>? getDate() async {
    final box = await Hive.openBox<String>("uid");
    return box.get("date");
  }
  Future<String?> writeDate() async {
    final box = await Hive.openBox<String>("uid");
    final String today = DateTime.now().toString(); 
    box.put("date", today); 
    return today;
  }
  void writeLastDate(String lastDay) async {
    final box = await Hive.openBox<String>("uid");
    box.put("last_date", lastDay);
  }
  Future<String?>? lastDate() async {
    final box = await Hive.openBox<String>("uid");
    return box.get("last_date");
  }
}