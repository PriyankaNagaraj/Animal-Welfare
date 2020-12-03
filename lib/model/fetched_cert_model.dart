class FetchedCertificate {
  int id;
  int issuedOn;
  String issuedLocationMapUrl;
  String certificateDownloadUrl;
  String inspectionPlace;
  String certificatePath;
  Doctor issuedDoctor;

  FetchedCertificate(
      {this.id,
      this.issuedOn,
      this.issuedDoctor,
      this.issuedLocationMapUrl,
      this.certificateDownloadUrl,
      this.inspectionPlace,
      this.certificatePath});

  factory FetchedCertificate.fromJson(Map<String, dynamic> json) =>
      FetchedCertificate(
        id: json["id"],
        issuedOn: json["issuedOn"],
        issuedLocationMapUrl: json["issuedLocationMapUrl"],
        certificateDownloadUrl: json["certificateDownloadUrl"],
        inspectionPlace: json["inspectionPlace"],
        certificatePath: json["certificatePath"],
        issuedDoctor: Doctor.fromJson(json["issuedDoctor"]),
      );
}

class Doctor {
  int id;
  String governmentId;
  String firstName;
  String lastName;

  Doctor({this.id, this.governmentId, this.firstName, this.lastName});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
      id: json["id"],
      governmentId: json["governmentId"],
      firstName: json["firstName"],
      lastName: json["lastName"]);
}
