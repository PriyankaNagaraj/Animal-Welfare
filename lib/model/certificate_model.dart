class Certificate {
  int certificateId;
  PersonDetails consignorDetails = PersonDetails();
  PersonDetails consigneeDetails = PersonDetails();
  PersonDetails transportAgencyDetails = PersonDetails();
  PersonDetails driverDetails = PersonDetails();
  String driverLicenceNumber;
  String vehicleRegistrationNumber;
  TrueOrComments areAnimalsFreeFromDiseases = TrueOrComments();
  TrueOrComments noUnfitAnimals = TrueOrComments();
  TrueOrComments pregnantAnimalsAreNotMixedWithYoungerOnes = TrueOrComments();
  TrueOrComments differentClassesOfAnimalsAreSeparated = TrueOrComments();
  TrueOrComments noDiseasedAnimals = TrueOrComments();
  TrueOrComments animalsTranquilizedIfNeeded = TrueOrComments();
  TrueOrComments animalsHaveRequiredFeeds = TrueOrComments();
  String purposeOfTransportation;
  String applicationDetails;
  bool isRule96Certified = false;
  String inspectionPlace;
  int inspectionDateAndTime;
  String cattleSpecies;
  String wagonName;
  int numberOfCattle;
  String sex;
  String age;
  bool isRule46To56Certified;
  bool canAnimalsTravel12Hours;
  bool canAnimalsTravel;
  bool areAnimalsFed;
  bool areAnimalsVaccinated;
  double latitude;
  double longitude;
  TransportationDetails transportationDetails = TransportationDetails();
  TransportRouteDetails transportRouteDetails = TransportRouteDetails();
  VaccinationDetails vaccinationDetails = VaccinationDetails();
  List<AnimalDetails> animalDetails = List<AnimalDetails>();

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
      certificateId: json["certificateId"],
      consignorDetails: PersonDetails.fromJson(json["consignorDetails"]),
      consigneeDetails: PersonDetails.fromJson(json["consigneeDetails"]),
      transportAgencyDetails:
          PersonDetails.fromJson(json["transportAgencyDetails"]),
      driverDetails: PersonDetails.fromJson(json["driverDetails"]),
      driverLicenceNumber: json["driverLicenceNumber"],
      vehicleRegistrationNumber: json["vehicleRegistrationNumber"],
      areAnimalsFreeFromDiseases:
          TrueOrComments.fromJson(json["areAnimalsFreeFromDiseases"]),
      noUnfitAnimals: TrueOrComments.fromJson(json["noUnfitAnimals"]),
      pregnantAnimalsAreNotMixedWithYoungerOnes: TrueOrComments.fromJson(
          json["pregnantAnimalsAreNotMixedWithYoungerOnes"]),
      differentClassesOfAnimalsAreSeparated: TrueOrComments.fromJson(
          json["differentClassesOfAnimalsAreSeparated"]),
      noDiseasedAnimals: TrueOrComments.fromJson(json["noDiseasedAnimals"]),
      animalsTranquilizedIfNeeded:
          TrueOrComments.fromJson(json["animalsTranquilizedIfNeeded"]),
      animalsHaveRequiredFeeds:
          TrueOrComments.fromJson(json["animalsHaveRequiredFeeds"]),
      purposeOfTransportation: json["purposeOfTransportation"],
      applicationDetails: json["applicationDetails"],
      isRule96Certified: json["isRule96Certified"] == null ? false : json["isRule96Certified"],
      inspectionPlace: json["inspectionPlace"],
      inspectionDateAndTime: json["inspectionDateAndTime"],
      cattleSpecies: json["cattleSpecies"],
      wagonName: json["wagonName"],
      numberOfCattle: json["numberOfCattle"],
      sex: json["sex"],
      age: json["age"],
      isRule46To56Certified: json["isRule46To56Certified"],
      canAnimalsTravel12Hours: json["canAnimalsTravel12Hours"],
      canAnimalsTravel: json["canAnimalsTravel"],
      areAnimalsFed: json["areAnimalsFed"],
      areAnimalsVaccinated: json["areAnimalsVaccinated"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      transportationDetails:
          TransportationDetails.fromJson(json["transportationDetails"]),
      transportRouteDetails: (json["transportRouteDetails"] == null)
          ? TransportRouteDetails()
          : TransportRouteDetails.fromJson(json["transportRouteDetails"]),
      vaccinationDetails: (json["vaccinationDetails"] == null)
          ? VaccinationDetails()
          : VaccinationDetails.fromJson(json["vaccinationDetails"]),
      animalDetails: List<AnimalDetails>());

  Certificate(
      {this.certificateId,
      this.consignorDetails,
      this.consigneeDetails,
      this.transportAgencyDetails,
      this.driverDetails,
      this.driverLicenceNumber,
      this.vehicleRegistrationNumber,
      this.areAnimalsFreeFromDiseases,
      this.noUnfitAnimals,
      this.pregnantAnimalsAreNotMixedWithYoungerOnes,
      this.differentClassesOfAnimalsAreSeparated,
      this.noDiseasedAnimals,
      this.animalsTranquilizedIfNeeded,
      this.animalsHaveRequiredFeeds,
      this.purposeOfTransportation,
      this.applicationDetails,
      this.isRule96Certified,
      this.inspectionPlace,
      this.inspectionDateAndTime,
      this.cattleSpecies,
      this.wagonName,
      this.numberOfCattle,
      this.sex,
      this.age,
      this.isRule46To56Certified,
      this.canAnimalsTravel12Hours,
      this.canAnimalsTravel,
      this.areAnimalsFed,
      this.areAnimalsVaccinated,
      this.latitude,
      this.longitude,
      this.transportationDetails,
      this.transportRouteDetails,
      this.vaccinationDetails,
      this.animalDetails});

  Map<String, dynamic> toJson() => {
        "certificateId": certificateId,
        "consignorDetails": consignorDetails.toJson(),
        "consigneeDetails": consigneeDetails.toJson(),
        "transportAgencyDetails": transportAgencyDetails.toJson(),
        "driverDetails": driverDetails.toJson(),
        "driverLicenceNumber":
            driverLicenceNumber == null ? null : driverLicenceNumber,
        "inspectionPlace": inspectionPlace == null ? null : inspectionPlace,
        "inspectionDateAndTime":
            inspectionDateAndTime == null ? null : inspectionDateAndTime,
        "cattleSpecies": cattleSpecies == null ? null : cattleSpecies,
        "wagonName": wagonName == null ? null : wagonName,
        "sex": sex == null ? null : sex,
        "age": age == null ? null : age,
        "numberOfCattle": wagonName == null ? 0 : numberOfCattle,
        "vehicleRegistrationNumber": vehicleRegistrationNumber == null
            ? null
            : vehicleRegistrationNumber,
        "areAnimalsFreeFromDiseases": areAnimalsFreeFromDiseases.toJson(),
        "noUnfitAnimals": noUnfitAnimals.toJson(),
        "pregnantAnimalsAreNotMixedWithYoungerOnes":
            pregnantAnimalsAreNotMixedWithYoungerOnes.toJson(),
        "differentClassesOfAnimalsAreSeparated":
            differentClassesOfAnimalsAreSeparated.toJson(),
        "noDiseasedAnimals": noDiseasedAnimals.toJson(),
        "animalsTranquilizedIfNeeded": animalsTranquilizedIfNeeded.toJson(),
        "animalsHaveRequiredFeeds": animalsHaveRequiredFeeds.toJson(),
        "purposeOfTransportation":
            purposeOfTransportation == null ? null : purposeOfTransportation,
        "applicationDetails":
            applicationDetails == null ? null : applicationDetails,
        "isRule96Certified":
            isRule96Certified == null ? false : isRule96Certified,
        "isRule46To56Certified":
            isRule46To56Certified == null ? false : isRule46To56Certified,
        "canAnimalsTravel12Hours":
            canAnimalsTravel12Hours == null ? false : canAnimalsTravel12Hours,
        "canAnimalsTravel": canAnimalsTravel == null ? false : canAnimalsTravel,
        "areAnimalsFed": areAnimalsFed == null ? false : areAnimalsFed,
        "areAnimalsVaccinated":
            areAnimalsVaccinated == null ? false : areAnimalsVaccinated,
        "latitude": latitude == null ? 0 : latitude,
        "longitude": longitude == null ? 0 : longitude,
        "transportationDetails": transportationDetails.toJson(),
        "transportRouteDetails": transportRouteDetails.toJson(),
        "vaccinationDetails": vaccinationDetails.toJson(),
        "animalDetails":
            new List<dynamic>.from(animalDetails.map((x) => x.toJson())),
      };
}

class AnimalDetails {
  String species;
  String breed;
  String age;
  String coatDescription;
  String breedAndIdMarks;
  bool isFitForBreeding = false;
  bool isFitForDraughtPurpose = false;
  bool isFitForMilkingPurpose = false;
  SexAndCount sexAndCount = SexAndCount();

  AnimalDetails(
      {this.species,
      this.breed,
      this.age,
      this.coatDescription,
      this.breedAndIdMarks,
      this.isFitForBreeding,
      this.isFitForDraughtPurpose,
      this.isFitForMilkingPurpose,
      this.sexAndCount});

  factory AnimalDetails.fromJson(Map<String, dynamic> json) => AnimalDetails(
        species: json["species"],
        breed: json["breed"],
        age: json["age"],
        coatDescription: json["coatDescription"],
        breedAndIdMarks: json["breedAndIdMarks"],
        isFitForBreeding: json["isFitForBreeding"],
        isFitForDraughtPurpose: json["isFitForDraughtPurpose"],
        isFitForMilkingPurpose: json["isFitForMilkingPurpose"],
        sexAndCount: SexAndCount.fromJson(json["sexAndCount"]),
      );

  Map<String, dynamic> toJson() => {
        "species": species == null ? null : species,
        "breed": breed == null ? null : breed,
        "age": age == null ? null : age,
        "coatDescription": coatDescription == null ? null : coatDescription,
        "breedAndIdMarks": breedAndIdMarks == null ? null : breedAndIdMarks,
        "isFitForBreeding": isFitForBreeding == null ? false : isFitForBreeding,
        "isFitForDraughtPurpose":
            isFitForDraughtPurpose == null ? false : isFitForDraughtPurpose,
        "isFitForMilkingPurpose":
            isFitForMilkingPurpose == null ? false : isFitForMilkingPurpose,
        "sexAndCount": sexAndCount.toJson()
      };
}

class SexAndCount {
  int maleCount = 0;
  int femaleCount = 0;

  SexAndCount({this.maleCount, this.femaleCount});

  factory SexAndCount.fromJson(Map<String, dynamic> json) => SexAndCount(
      maleCount: json["maleCount"], femaleCount: json["femaleCount"]);

  Map<String, dynamic> toJson() => {
        "m": maleCount == null ? 0 : maleCount,
        "f": femaleCount == null ? 0 : femaleCount,
      };
}

class PersonDetails {
  String name;
  String address;
  String contactNumber;

  PersonDetails({this.name, this.address, this.contactNumber});

  factory PersonDetails.fromJson(Map<String, dynamic> json) => PersonDetails(
      name: json["name"],
      address: json["address"],
      contactNumber: json["contactNumber"]);

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "contactNumber": contactNumber == null ? null : contactNumber,
      };
}

class TrueOrComments {
  bool isTrue;
  String commentsIfFalse;

  TrueOrComments({this.isTrue, this.commentsIfFalse});

  factory TrueOrComments.fromJson(Map<String, dynamic> json) => TrueOrComments(
      isTrue: json["isTrue"], commentsIfFalse: json["commentsIfFalse"]);

  Map<String, dynamic> toJson() => {
        "isTrue": isTrue == null ? null : isTrue,
        "commentsIfFalse": commentsIfFalse == null ? null : commentsIfFalse,
      };
}

class TransportationDetails {
  int dateAndTime;
  String place;
  String transportationMode;
  int departureTime;
  int arrivalTime;

  TransportationDetails(
      {this.dateAndTime,
      this.place,
      this.transportationMode,
      this.departureTime,
      this.arrivalTime});

  factory TransportationDetails.fromJson(Map<String, dynamic> json) =>
      TransportationDetails(
          dateAndTime: json["dateAndTime"],
          place: json["place"],
          transportationMode: json["transportationMode"],
          departureTime: json["departureTime"],
          arrivalTime: json["arrivalTime"]);

  Map<String, dynamic> toJson() => {
        "dateAndTime": dateAndTime == null ? null : dateAndTime,
        "place": place == null ? null : place,
        "transportationMode":
            transportationMode == null ? null : transportationMode,
        "departureTime": departureTime == null ? null : departureTime,
        "arrivalTime": arrivalTime == null ? null : arrivalTime,
      };
}

class TransportRouteDetails {
  String from;
  String to;
  String via;
  String duration;

  TransportRouteDetails({this.from, this.to, this.via, this.duration});

  factory TransportRouteDetails.fromJson(Map<String, dynamic> json) =>
      TransportRouteDetails(
          from: json["from"],
          to: json["to"],
          via: json["via"],
          duration: json["duration"]);

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from,
        "to": to == null ? null : to,
        "via": via == null ? null : via,
        "duration": duration == null ? null : duration,
      };
}

class VaccinationDetails {
  String vaccineType;
  int vaccinatedDate;
  String address;
  String contactNumber;

  VaccinationDetails(
      {this.vaccineType,
      this.vaccinatedDate,
      this.address,
      this.contactNumber});

  factory VaccinationDetails.fromJson(Map<String, dynamic> json) =>
      VaccinationDetails(
          vaccineType: json["vaccineType"],
          vaccinatedDate: json["vaccinatedDate"],
          address: json["address"],
          contactNumber: json["contactNumber"]);

  Map<String, dynamic> toJson() => {
        "vaccineType": vaccineType == null ? null : vaccineType,
        "vaccinatedDate": vaccinatedDate == null ? null : vaccinatedDate,
        "address": address == null ? null : address,
        "contactNumber": contactNumber == null ? null : contactNumber,
      };
}
