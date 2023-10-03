class Numbers {
  String? status;
  String? message;
  int? totalLatestPages;
  List<Data>? data;

  Numbers({this.status, this.message, this.totalLatestPages, this.data});

  Numbers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalLatestPages = json['totalLatestPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['totalLatestPages'] = this.totalLatestPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? country;
  String? userProfileId;
  String? summation;
  String? numberThat;
  bool? isMobile;
  bool? isVehicle;
  String? numberValue;
  List<String>? listingType;
  bool? isOpen;
  bool? isFixed;
  bool? isLive;
  String? sellerRating;
  String? countryCode;
  bool? isPublic;
  int? min;
  int? max;
  bool? isActive;
  bool? isPaid;
  String? paymentId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.country,
      this.userProfileId,
      this.summation,
      this.numberThat,
      this.isMobile,
      this.isVehicle,
      this.numberValue,
      this.listingType,
      this.isOpen,
      this.isFixed,
      this.isLive,
      this.sellerRating,
      this.countryCode,
      this.isPublic,
      this.min,
      this.max,
      this.isActive,
      this.isPaid,
      this.paymentId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    userProfileId = json['userProfileId'];
    summation = json['summation'];
    numberThat = json['numberThat'];
    isMobile = json['isMobile'];
    isVehicle = json['isVehicle'];
    numberValue = json['numberValue'];
    listingType = json['listingType'].cast<String>();
    isOpen = json['isOpen'];
    isFixed = json['isFixed'];
    isLive = json['isLive'];
    sellerRating = json['sellerRating'];
    countryCode = json['countryCode'];
    isPublic = json['isPublic'];
    min = json['min'];
    max = json['max'];
    isActive = json['isActive'];
    isPaid = json['isPaid'];
    paymentId = json['paymentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['country'] = this.country;
    data['userProfileId'] = this.userProfileId;
    data['summation'] = this.summation;
    data['numberThat'] = this.numberThat;
    data['isMobile'] = this.isMobile;
    data['isVehicle'] = this.isVehicle;
    data['numberValue'] = this.numberValue;
    data['listingType'] = this.listingType;
    data['isOpen'] = this.isOpen;
    data['isFixed'] = this.isFixed;
    data['isLive'] = this.isLive;
    data['sellerRating'] = this.sellerRating;
    data['countryCode'] = this.countryCode;
    data['isPublic'] = this.isPublic;
    data['min'] = this.min;
    data['max'] = this.max;
    data['isActive'] = this.isActive;
    data['isPaid'] = this.isPaid;
    data['paymentId'] = this.paymentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
