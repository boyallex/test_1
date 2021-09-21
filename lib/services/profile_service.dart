

import 'package:firebase_database/firebase_database.dart';
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

  DatabaseReference increment(ProfileButtonType type) {
    DatabaseReference _ref = FirebaseDatabase.instance.reference().child("test");
    return _ref;
    // switch (type) {
    //   case ProfileButtonType.suicide:
    //     _ref.set(suicide_value++);
    //     break;
    //   default:
    // }
  }
}