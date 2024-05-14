class PatientLogin {
  String? massage;
  String? token;
  User? user;
  String? stutes;

  PatientLogin({this.massage, this.token, this.user, this.stutes});

  PatientLogin.fromJson(Map<String, dynamic> json) {
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
  String? gender;
  String? phone;
  String? date;
  int? age;
  String? ssn;
  String? address;
  Null? location;
  Null? midecalHistory;
  Null? image;
  Null? extentaion;
  Null? doctorId;

  User(
      {this.id,
        this.name,
        this.email,
        this.gender,
        this.phone,
        this.date,
        this.age,
        this.ssn,
        this.address,
        this.location,
        this.midecalHistory,
        this.image,
        this.extentaion,
        this.doctorId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['Gender'];
    phone = json['phone'];
    date = json['date'];
    age = json['age'];
    ssn = json['ssn'];
    address = json['address'];
    location = json['location'];
    midecalHistory = json['midecal_history'];
    image = json['image'];
    extentaion = json['Extentaion'];
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['Gender'] = this.gender;
    data['phone'] = this.phone;
    data['date'] = this.date;
    data['age'] = this.age;
    data['ssn'] = this.ssn;
    data['address'] = this.address;
    data['location'] = this.location;
    data['midecal_history'] = this.midecalHistory;
    data['image'] = this.image;
    data['Extentaion'] = this.extentaion;
    data['doctor_id'] = this.doctorId;
    return data;
  }
}