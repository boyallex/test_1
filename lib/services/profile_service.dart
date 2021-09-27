import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/hive_service.dart';

class ProfileService {
  final HiveFile localStorage = HiveFile();
  ProfileService();

  Future<List<int?>> getAll() async {
    final String uid = (await localStorage.read())!;
    final col = await FirebaseFirestore.instance.collection(uid).doc("give_up").get();
    final data = col.data()!;
    final List<int?> res = [data["give_up"], data["sucide"], data["bleat"]];
    return res;
  }

  Future<int?> increment(ProfileButtonType type, int count) async {
    final String uid = (await localStorage.read())!;
    final ref = FirebaseFirestore.instance.collection(uid);
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
