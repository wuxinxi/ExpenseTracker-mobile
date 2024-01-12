import 'package:app_network/src/base/api_response.dart';

/// token : {"accessToken":"","refreshToken":""}
/// userAvatarUrl : ""
/// userCreateDate : ""
/// userEmail : ""
/// userGender : 0
/// userName : ""
/// userPhone : ""

class UserModel extends ApiResponse {
  UserModel({
    Token? token,
    String? userAvatarUrl,
    String? userCreateDate,
    String? userEmail,
    num? userGender,
    String? userName,
    String? userPhone,
  }) {
    _token = token;
    _userAvatarUrl = userAvatarUrl;
    _userCreateDate = userCreateDate;
    _userEmail = userEmail;
    _userGender = userGender;
    _userName = userName;
    _userPhone = userPhone;
  }

  @override
  UserModel fromJson(dynamic json) {
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
    _userAvatarUrl = json['userAvatarUrl'];
    _userCreateDate = json['userCreateDate'];
    _userEmail = json['userEmail'];
    _userGender = json['userGender'];
    _userName = json['userName'];
    _userPhone = json['userPhone'];
    return this;
  }

  Token? _token;
  String? _userAvatarUrl;
  String? _userCreateDate;
  String? _userEmail;
  num? _userGender;
  String? _userName;
  String? _userPhone;

  UserModel copyWith({
    Token? token,
    String? userAvatarUrl,
    String? userCreateDate,
    String? userEmail,
    num? userGender,
    String? userName,
    String? userPhone,
  }) =>
      UserModel(
        token: token ?? _token,
        userAvatarUrl: userAvatarUrl ?? _userAvatarUrl,
        userCreateDate: userCreateDate ?? _userCreateDate,
        userEmail: userEmail ?? _userEmail,
        userGender: userGender ?? _userGender,
        userName: userName ?? _userName,
        userPhone: userPhone ?? _userPhone,
      );

  Token? get token => _token;

  String? get userAvatarUrl => _userAvatarUrl;

  String? get userCreateDate => _userCreateDate;

  String? get userEmail => _userEmail;

  num? get userGender => _userGender;

  String? get userName => _userName;

  String? get userPhone => _userPhone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    map['userAvatarUrl'] = _userAvatarUrl;
    map['userCreateDate'] = _userCreateDate;
    map['userEmail'] = _userEmail;
    map['userGender'] = _userGender;
    map['userName'] = _userName;
    map['userPhone'] = _userPhone;
    return map;
  }
}

/// accessToken : ""
/// refreshToken : ""

class Token {
  Token({
    String? accessToken,
    String? refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  Token.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  String? _accessToken;
  String? _refreshToken;

  Token copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Token(
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
      );

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}
