import 'package:app_utils/app_utils.dart';

part 'user_data.g.dart';

///
/// @date: 2023/7/12 20:36
/// @author: Sensi
/// @remark:
///
@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0, defaultValue: '')
  String userName;

  @HiveField(1, defaultValue: '')
  String userEmail;

  @HiveField(2, defaultValue: 0)
  int userGender = 0;

  @HiveField(3)
  String? userPhone;

  @HiveField(4)
  String? userCreateDate;

  @HiveField(5)
  String? userAvatarUrl;

  @HiveField(6)
  String refreshToken;
  @HiveField(7)
  String? accessToken;

  UserData({
    required this.userName,
    required this.userEmail,
    required this.refreshToken,
    required this.accessToken,
    this.userGender = 0,
    this.userPhone,
    this.userCreateDate,
    this.userAvatarUrl,
  });

  UserData.fromMap(Map<String, dynamic> userMap)
      : userName = userMap['userName'] ?? '',
        userEmail = userMap['userEmail'] ?? '',
        userGender = userMap['userGender'] ?? 0,
        userPhone = userMap['userPhone'],
        userCreateDate = userMap['userCreateDate'],
        userAvatarUrl = userMap['userAvatarUrl'],
        refreshToken = userMap['token']['refreshToken'],
        accessToken = userMap['token']['accessToken'];
}
