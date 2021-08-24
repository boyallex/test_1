import 'package:test_1/modules/login_data.dart';

import '../test_globals.dart' as globals;

class LoginService {
  Future<List<LoginData>> getData() async{
    final data = globals.json;
    return await Future.delayed(Duration()).then((_)=>data.map((e) => LoginData.fromJson(e)).toList());
  }
}