import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';

class ProfileService {
  String? uid;
  ProfileService(this.uid);

  // Future getData(ProfileButtonType type) {
  //   late final res;
  //   switch (type) {
  //     case ProfileButtonType.suicide:
  //       res = FirebaseDatabase.instance.reference().child("").get();
  //       break;
  //     case ProfileButtonType.bleat:

  //     default:
  //       res = 0;
  //     return res;
  //   }
  // }



  int? increment(ProfileButtonType type, int count) {
    final ref = FirebaseFirestore.instance.collection(this.uid!);
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
