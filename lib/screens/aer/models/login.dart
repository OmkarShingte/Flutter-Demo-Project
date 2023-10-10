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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['message'] = this.message;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['OTP'] = this.otp;
    return data;
  }
}
