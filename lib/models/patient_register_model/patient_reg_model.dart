class PatientRegister {
  String? status;
  String? message;
  String? token;
  Patient? patient;

  PatientRegister({this.status, this.message, this.token, this.patient});

  PatientRegister.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    return data;
  }
}

class Patient {
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? date;
  String? age;
  String? ssn;
  String? address;
  int? id;

  Patient(
      {this.name,
        this.email,
        this.gender,
        this.phone,
        this.date,
        this.age,
        this.ssn,
        this.address,
        this.id});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    gender = json['Gender'];
    phone = json['phone'];
    date = json['date'];
    age = json['age'];
    ssn = json['ssn'];
    address = json['address'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['Gender'] = this.gender;
    data['phone'] = this.phone;
    data['date'] = this.date;
    data['age'] = this.age;
    data['ssn'] = this.ssn;
    data['address'] = this.address;
    data['id'] = this.id;
    return data;
  }
}
