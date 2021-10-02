class ProfileRepository {
  Map<String, dynamic>? userEmotions;
  Map<String, dynamic>? lastUserEmotions;
  ProfileRepository([this.userEmotions, this.lastUserEmotions]);
  ProfileRepository.empty() {
    this.userEmotions = {"bleat": 0, "suicide": 0, "give_up": 0};
    this.lastUserEmotions = {"bleat": 0, "suicide": 0, "give_up": 0};
  }

  bool isEmpty() {
    return userEmotions!["suicide"] == 0 &&
        userEmotions!["give_up"] == 0 &&
        userEmotions!["bleat"] == 0;
  }
}
