class DoctorLogin {
  String? massage;
  String? token;
  User? user;
  String? stutes;

  DoctorLogin({this.massage, this.token, this.user, this.stutes});

  DoctorLogin.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    token = json['Token'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    stutes = json['stutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['Token'] = this.token;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['stutes'] = this.stutes;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phone;
  String? address;
  String? degree;
  Null? image;
  Null? extentaion;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.address,
        this.degree,
        this.image,
        this.extentaion});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    address = json['address'];
    degree = json['degree'];
    image = json['image'];
    extentaion = json['Extentaion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['degree'] = this.degree;
    data['image'] = this.image;
    data['Extentaion'] = this.extentaion;
    return data;
  }
}