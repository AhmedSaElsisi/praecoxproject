
class RmiUploadModel{
  String? diagnosticStage;
  String? image;
  String? descriptionDiagnosis;

  RmiUploadModel({this.diagnosticStage, this.image, this.descriptionDiagnosis});

  RmiUploadModel.fromJson(Map<String, dynamic> json) {
    diagnosticStage = json['Diagnostic_stage'];
    image = json['image'];
    descriptionDiagnosis = json['Description_Diagnosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Diagnostic_stage'] = this.diagnosticStage;
    data['image'] = this.image;
    data['Description_Diagnosis'] = this.descriptionDiagnosis;
    return data;
  }
}
