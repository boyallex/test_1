import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/hive_service.dart';

class ProfileService {
  final HiveFile localStorage = HiveFile();
  ProfileService();

  Future<Map<String, dynamic>?> getAll() async {
    final String uid = (await localStorage.read())!;
    final data = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    // final data = col.data();
    print(data.data());
    // final List<int> res = [data.data()!["give_up"], data.data()!["sucide"], data.data()!["bleat"]];
    return data.data();
  }

  Future<int?> increment(ProfileButtonType type, int count) async {
    final String uid = (await localStorage.read())!;
    final ref = FirebaseFirestore.instance.collection("users");
    var count;
    switch (type) {
      case ProfileButtonType.suicide:
        count = ref.doc("suicide");
        print(count);
        // ref.add(suicide_value++);
        break;
      case ProfileButtonType.give_up:
        count = ref.doc("give_up").get();
        print(count);
        
        // ref.add(suicide_value++);
        break;
      case ProfileButtonType.bleat:
        count = ref.doc("bleat");
        print(count);
        // ref.add(suicide_value++);
        break;
      default:
    }
  }
}
