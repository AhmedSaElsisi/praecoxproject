class ProfileData {
  String? status;
  String? message;
  Data? data;

  ProfileData({this.status, this.message, this.data});

  ProfileData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? date;
  int? age;
  String? ssn;
  String? address;
  Null? location;


  Data({this.name, this.email, this.password, this.gender, this.phone, this.date, this.age, this.ssn, this.address, this.location,});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['Gender'];
    phone = json['phone'];
    date = json['date'];
    age = json['age'];
    ssn = json['ssn'];
    address = json['address'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['Gender'] = this.gender;
    data['phone'] = this.phone;
    data['date'] = this.date;
    data['age'] = this.age;
    data['ssn'] = this.ssn;
    data['address'] = this.address;
    data['location'] = this.location;
    return data;
  }
}
