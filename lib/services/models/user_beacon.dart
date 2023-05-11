class UserBeacon {
  final id;
  String? idBeacon;
  String? idUser;
  String? idPerso;
  bool? beaconAdmin;

  UserBeacon(
      {required this.id,
      this.idBeacon,
      this.beaconAdmin,
      this.idPerso,
      this.idUser});

  factory UserBeacon.fromJson(Map<String, dynamic> json) {
    return UserBeacon(
        id: json['id'],
        idBeacon: json['id_balise'],
        idPerso: json['ID_perso'],
        idUser: json['id_user'],
        beaconAdmin: json['administrateur_balise']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_balise": idBeacon,
        "id_user": idUser,
        "ID_perso": idPerso,
        "administrateur_balise": beaconAdmin,
      };
}
