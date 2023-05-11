import 'package:resk_you_mobile/services/models/address.dart';
import 'package:resk_you_mobile/services/models/user_beacon.dart';

import 'contact.dart';

class User {
  String id;
  String idHelppLife;
  String email;
  String password;
  String? confirm_password;
  String? lastname;
  String? firstname;
  bool? active;
  //1- société , 2-mobile, 3-pompier
  String? accountType;
  //1 homme
  int? sexe;
  DateTime? birthDate;
  String? telephone;
  List<UserBeacon>? associatedBeacon;
  // organisations_associees devra correspondre a une liste selon son model
  List? associatedCompanies;
  String? zipcode;
  String? tokenEmail;
  Address? address;
  List<Contact>? contacts;
  bool? onAlert;
  String? service;

  User({
    required this.id,
    required this.idHelppLife,
    required this.email,
    required this.password,
    this.confirm_password,
    this.lastname,
    this.firstname,
    this.active,
    this.accountType,
    this.sexe,
    this.birthDate,
    this.telephone,
    this.associatedBeacon,
    this.associatedCompanies,
    this.zipcode,
    this.tokenEmail,
    this.address,
    this.contacts,
    this.onAlert,
    this.service,
  });

  User copyWith({
    String? id,
    String? idHelppLife,
    String? email,
    String? password,
    String? confirm_password,
    String? lastname,
    String? firstname,
    int? sexe,
    DateTime? birthDate,
    String? telephone,
    String? zipcode,
    bool? active,
    String? accountType,
    List<UserBeacon>? associatedBeacon,
    List? associatedCompanies,
    List<Contact>? contacts,
    Address? address,
    String? tokenEmail,
    bool? onAlert,
    String? service,
  }) {
    return User(
      id: id ?? this.id,
      idHelppLife: idHelppLife ?? this.idHelppLife,
      email: email ?? this.email,
      password: password ?? this.password,
      confirm_password: confirm_password ?? this.confirm_password,
      lastname: lastname ?? this.lastname,
      firstname: firstname ?? this.firstname,
      sexe: sexe ?? this.sexe,
      birthDate: birthDate ?? this.birthDate,
      telephone: telephone ?? this.telephone,
      zipcode: zipcode ?? this.zipcode,
      active: active ?? this.active,
      accountType: accountType ?? this.accountType,
      associatedBeacon: associatedBeacon ?? this.associatedBeacon,
      associatedCompanies: associatedCompanies ?? this.associatedCompanies,
      contacts: contacts ?? this.contacts,
      address: address ?? this.address,
      tokenEmail: tokenEmail ?? this.tokenEmail,
      onAlert: onAlert ?? this.onAlert,
      service: service ?? this.service,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      idHelppLife: json['id_helpp_life'],
      email: json['email'],
      password: json['password'],
      confirm_password: json['confirm_password'],
      lastname: json['nom'],
      firstname: json['prenom'],
      active: json['actif'],
      accountType: json['type_compte'],
      sexe: json['sexe'],
      birthDate: DateTime.parse(json['date_naissance']),
      telephone: json['telephone'],
      associatedBeacon: json['balises_associes']
          .map<UserBeacon>((e) => UserBeacon.fromJson(e))
          .toList(),
      associatedCompanies: json['organisations_associees'],
      zipcode: json['postcode'],
      tokenEmail: json['token_email'],
      address: Address.fromJson(json['adresse']),
      contacts:
          json['contacts'].map<Contact>((e) => Contact.fromJson(e)).toList(),
      onAlert: json['en_alerte'],
      service: json['service'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_helpp_life": idHelppLife,
        "email": email,
        "password": password,
        "confirm_password": confirm_password,
        "nom": lastname,
        "prenom": firstname,
        "actif": active,
        "type_compte": accountType,
        "sexe": sexe,
        "date_naissance": birthDate?.toIso8601String(),
        "telephone": telephone,
        "balises_associes": associatedBeacon,
        "organisations_associees": associatedCompanies,
        "postcode": zipcode,
        "token_email": tokenEmail,
        "adresse": address,
        "contacts": contacts,
        "en_alerte": onAlert,
        "service": service,
      };

  @override
  String toString() {
    return "id: $id -- idHelppLife: $idHelppLife -- email: $email -- password: $password -- confirm_password: $confirm_password -- nom: $lastname -- prenom: $firstname -- actif: $active -- addresse: $address -- type_compte: $accountType -- date_naissance: $birthDate -- sexe: $sexe -- organisations_associees: $associatedCompanies -- contacts: $contacts -- balises_associes: $associatedBeacon -- postcode: $zipcode";
  }
}
