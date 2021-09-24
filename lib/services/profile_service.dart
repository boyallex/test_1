

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';

class ProfileService {
  ProfileService();

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

  // Future<String> getUid(String uid) async { 
  //   return FirebaseFirestore.instance.collection(uid);
  // }

  void increment(ProfileButtonType type) {
    final _ref = FirebaseFirestore.instance.collection(type.toString());
    return;
    // switch (type) {
    //   case ProfileButtonType.suicide:
    //     _ref.set(suicide_value++);
    //     break;
    //   default:
    // }
  }
}