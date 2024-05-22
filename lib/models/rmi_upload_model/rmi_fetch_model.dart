class RmiFetchModel {
  String? status;
  String? message;
  List<Data>? data;

  RmiFetchModel({this.status, this.message, this.data});

  RmiFetchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? diagnosticStage;
  String? dateDiagnosis;
  String? descriptionDiagnosis;
  String? image;
  int? patientId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.diagnosticStage,
        this.dateDiagnosis,
        this.descriptionDiagnosis,
        this.image,
        this.patientId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diagnosticStage = json['Diagnostic_stage'];
    dateDiagnosis = json['Date_Diagnosis'];
    descriptionDiagnosis = json['Description_Diagnosis'];
    image = json['image'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Diagnostic_stage'] = this.diagnosticStage;
    data['Date_Diagnosis'] = this.dateDiagnosis;
    data['Description_Diagnosis'] = this.descriptionDiagnosis;
    data['image'] = this.image;
    data['patient_id'] = this.patientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
