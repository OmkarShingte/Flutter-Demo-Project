class LoginUser {
  int? status;
  String? msg;
  String? message;
  int? userType;
  String? email;
  String? otp;

  LoginUser({this.status, this.msg, this.message, this.userType, this.email, this.otp});

  LoginUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    message = json['message'];
    userType = json['user_type'];
    email = json['email'];
    otp = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['message'] = message;
    data['user_type'] = userType;
    data['email'] = email;
    data['OTP'] = otp;
    return data;
  }
}
