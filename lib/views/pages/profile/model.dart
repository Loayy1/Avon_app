
class ProfileInfoData {
  late final ProfileDataModel list;

  ProfileInfoData.fromJson(Map<String, dynamic> json) {
    list = ProfileDataModel.fromJson(json);
  }
}

class ProfileDataModel {
  late final int id;
  late final String username;
  late final String email;
  late final String role;
  late final String phoneNumber;
  late final String countryCode;
  late final String profilePhotoUrl;
  late final String? otpCode;
  late final String? otpExpiration;

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    role = json['role'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    countryCode = json['countryCode'] ?? '';
    profilePhotoUrl = json['profilePhotoUrl'] ?? '';
    otpCode = json['otpCode'];
    otpExpiration = json['otpExpiration'];
  }
}
