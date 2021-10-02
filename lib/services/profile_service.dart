import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/repositories/profile_repository.dart';
import 'package:test_1/services/hive_service.dart';

class ProfileService {
  final HiveFile localStorage = HiveFile();
  ProfileService();

  Future<ProfileRepository> getAll() async {
    final String uid = (await localStorage.read())!;
    final document = FirebaseFirestore.instance.collection("users").doc(uid);
    final data = await document.get();
    final lastData = await document
        .collection("dates")
        .doc(await this.localStorage.lastDate())
        .get();
    final Map<String, dynamic> notNullData = lastData.data() ?? {"suicide": 0, "give_up": 0, "bleat": 0};
    
    return ProfileRepository(data.data(),notNullData);
  }

  void rememberHiveDate() async {
    await this.localStorage.writeDate();
  }

  Future<ProfileRepository> rememberDate(ProfileRepository repository) async {
    final String? lastDay = await this.localStorage.getDate();
    this.localStorage.writeLastDate(lastDay!); // сохраняем дату прошлого дня
    // получаем uid локально
    final String uid = (await localStorage.read())!;
    // запрос к FireStore
    final user = FirebaseFirestore.instance.collection("users").doc(uid);
    // создаем пустой репозиторий нового дня
    final emptyRep = ProfileRepository.empty();
    // сохраняем в нем старые данные для отображения
    emptyRep.lastUserEmotions = repository.lastUserEmotions;
    // сохраняем старые данные на сервере
    user.collection("dates").doc(lastDay).set(repository.userEmotions!);
    // записываем сегдоняшнюю дату в файл
    await this.localStorage.writeDate();
    // обнуляем данные на сервере
    user.set(emptyRep.userEmotions!);

    return emptyRep;
  }

  // заходил ли пользователь сегодня
  Future<bool> isOpened() async {
    final today = await this.localStorage.getDate(); // береме данные из файла
    return today!.substring(0, 10) ==
        DateTime.now().toString().substring(0, 10);
  }

  Future<ProfileRepository> increment(ProfileButtonType type) async {
    // берем ID из локального хранилища
    final String uid = (await localStorage.read())!;
    // запрос на FireStore
    final col = FirebaseFirestore.instance.collection("users").doc(uid);
    final data = await col.get();
    // берем данные за прошлый день с сервера
    final lastData =
        await col.collection('dates').doc(await localStorage.lastDate()).get();

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

        return ProfileRepository(m, lastData.data());
      case ProfileButtonType.give_up:
        counter = data.data()!["give_up"];
        counter++;
        final Map<String, int> m = {
          "bleat": data.data()!["bleat"],
          "give_up": counter,
          "suicide": data.data()!["suicide"],
        };
        col.set(m);

        return ProfileRepository(m, lastData.data());
      case ProfileButtonType.bleat:
        counter = data.data()!["give_up"];
        counter++;
        final Map<String, int> m = {
          "bleat": counter,
          "give_up": data.data()!["give_up"],
          "suicide": data.data()!["suicide"],
        };
        col.set(m);

        return ProfileRepository(m, lastData.data());
    }
  }
}
