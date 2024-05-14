class DoctorRegister {
  String? stutes;
  String? massage;
  String? token;
  Patient? patient;

  DoctorRegister({this.stutes, this.massage, this.token, this.patient});

  DoctorRegister.fromJson(Map<String, dynamic> json) {
    stutes = json['stutes'];
    massage = json['massage'];
    token = json['token'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stutes'] = this.stutes;
    data['massage'] = this.massage;
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
  String? phone;
  String? address;
  String? degree;
  int? id;

  Patient(
      {this.name, this.email, this.phone, this.address, this.degree, this.id});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    degree = json['degree'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['degree'] = this.degree;
    data['id'] = this.id;
    return data;
  }
}