///
/// @date: 2023/7/9 12:15
/// @author: Sensi
/// @remark:
///

class LoginRequestModel {
  final String userEmail;
  final String userPassword;

  LoginRequestModel(this.userEmail, this.userPassword);

  Map<String, dynamic> toJson() {
    return {"userEmail": userEmail, "userPassword": userPassword};
  }
}
