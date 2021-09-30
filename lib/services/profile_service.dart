import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/hive_service.dart';

class ProfileService {
  final HiveFile localStorage = HiveFile();
  ProfileService();

  Future<Map<String, dynamic>?> getAll() async {
    final String uid = (await localStorage.read())!;
    final data =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return data.data();
  }

  Future<Map<String, int>> increment(ProfileButtonType type) async {
    final String uid = (await localStorage.read())!;
    final col = FirebaseFirestore.instance.collection("users").doc(uid);
    final data = await col.get();
    int counter;
    switch (type) {
      case ProfileButtonType.suicide:
        counter = data.data()!["suicide"];
        counter++;
        final Map<String, int> m = {
          "bleat": await data.data()!["bleat"],
          "give_up": await data.data()!["give_up"],
          "suicide": counter,
        };
        col.set(m);
        return m;
      case ProfileButtonType.give_up:
        counter = data.data()!["give_up"];
        counter++;
        final Map<String, int> m = {
          "bleat": data.data()!["bleat"],
          "give_up": counter,
          "suicide": data.data()!["suicide"],
        };
        col.set(m);
        return m;
      case ProfileButtonType.bleat:
        counter = data.data()!["give_up"];
        counter++;
        final Map<String, int> m = {
          "bleat": counter,
          "give_up": data.data()!["give_up"],
          "suicide": data.data()!["suicide"],
        };
        col.set(m);
        return m;
    }
  }
}
