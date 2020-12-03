class Certificate {
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

  Map<String, dynamic> toJson() => {
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

  Map<String, dynamic> toJson() => {
        "m": maleCount == null ? 0 : maleCount,
        "f": femaleCount == null ? 0 : femaleCount,
      };
}

class PersonDetails {
  String name;
  String address;
  String contactNumber;

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "contactNumber": contactNumber == null ? null : contactNumber,
      };
}

class TrueOrComments {
  bool isTrue;
  String commentsIfFalse;

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

  Map<String, dynamic> toJson() => {
        "vaccineType": vaccineType == null ? null : vaccineType,
        "vaccinatedDate": vaccinatedDate == null ? null : vaccinatedDate,
        "address": address == null ? null : address,
        "contactNumber": contactNumber == null ? null : contactNumber,
      };
}
