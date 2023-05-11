class Address {
  final id;
  final idUser;
  String? idBeacon; //id_balise
  String? idCompany; //id_organisation
  int addressNumber; //adresse_numero
  String? addressComplementNumber;
  String? addressComplement; // adresse_complement_numero
  String? addressStreet; // adresse_rue
  String? addressCity; // adresse_ville
  String? addressCountry; // adresse_pays
  int? addressFloor; // adresse_etage
  int? addressDoorNumber; // adresse_numero_porte
  int? addressZipcode; // adresse_code_postal
  String? addressMore; // adresse_points_remarquables

  Address(
      {this.id,
      this.idUser,
      this.idBeacon,
      this.idCompany,
      required this.addressNumber,
      this.addressComplementNumber,
      this.addressComplement,
      this.addressStreet,
      this.addressCity,
      this.addressCountry,
      this.addressFloor,
      this.addressDoorNumber,
      this.addressZipcode,
      this.addressMore});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      idUser: json['id_user'],
      addressNumber: json['adresse_numero'],
      addressStreet: json['adresse_rue'],
      addressCity: json['adresse_ville'],
      addressCountry: json['adresse_pays'],
      addressZipcode: json['adresse_code_postal'],
      idBeacon: json['id_balise'],
      idCompany: json['id_organisation'],
      addressComplementNumber: json['adresse_complement_numero'],
      addressComplement: json['adresse_complement'],
      addressDoorNumber: json['adresse_numero_porte'],
      addressFloor: json['adresse_etage'],
      addressMore: json['adresse_points_remarquables'],
    );
  }

  Address copyWith({
    String? id,
    String? idUser,
    String? idBeacon, //id_balise
    String? idCompany, //id_organisation
    int? addressNumber, //adresse_numero
    String? addressComplementNumber,
    String? addressComplement, // adresse_complement_numero
    String? addressStreet, // adresse_rue
    String? addressCity, // adresse_ville
    String? addressCountry, // adresse_pays
    int? addressFloor, // adresse_etage
    int? addressDoorNumber, // adresse_numero_porte
    int? addressZipcode, // adresse_code_postal
    String? addressMore, // adresse_points_remarquables
  }) {
    return Address(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      addressNumber: addressNumber ?? this.addressNumber,
      addressStreet: addressStreet ?? this.addressStreet,
      addressCity: addressCity ?? this.addressCity,
      addressCountry: addressCountry ?? this.addressCountry,
      addressZipcode: addressZipcode ?? this.addressZipcode,
      idBeacon: idBeacon ?? this.idBeacon,
      idCompany: idCompany ?? this.idCompany,
      addressComplementNumber: addressComplementNumber ?? this.addressComplementNumber,
      addressComplement: addressComplement ?? this.addressComplement,
      addressDoorNumber: addressDoorNumber ?? this.addressDoorNumber,
      addressFloor: addressFloor ?? this.addressFloor,
      addressMore: addressMore ?? this.addressMore,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_balise": idBeacon,
        "id_organisation": idCompany,
        "adresse_numero": addressNumber,
        "adresse_complement_numero": addressComplementNumber,
        "adresse_rue": addressStreet,
        "adresse_complement": addressComplement,
        "adresse_etage": addressFloor,
        "adresse_numero_porte": addressDoorNumber,
        "adresse_code_postal": addressZipcode,
        "adresse_ville": addressCity,
        "adresse_pays": addressCountry,
        "adresse_points_remarquables": addressMore,
      };
}
