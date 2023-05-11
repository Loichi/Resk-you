class Hospitalization {
  final id;
  String nameHospitalization;
  String dateHospitalization;
  String dateEndHospitalization;
  final String uuid;

  /// name_hospitalization = nom_hospitalisation
  /// date_hospitalization = date_hospitalisation
  /// date_end_hospitalization = date_fin_hospitalisation

  Hospitalization({
    required this.id,
    required this.nameHospitalization,
    required this.dateHospitalization,
    required this.dateEndHospitalization,
    required this.uuid,
  });

  Hospitalization copyWith({
    String? id,
    String? nameHospitalization,
    String? dateHospitalization,
    String? dateEndHospitalization,
    String? uuid,
  }) {
    return Hospitalization(
      id: id ?? this.id,
      nameHospitalization: nameHospitalization ?? this.nameHospitalization,
      dateHospitalization: dateHospitalization ?? this.dateHospitalization,
      dateEndHospitalization:
          dateEndHospitalization ?? this.dateEndHospitalization,
      uuid: uuid ?? this.uuid,
    );
  }

  factory Hospitalization.fromJson(Map<String, dynamic> json) {
    return Hospitalization(
      id: json['id'],
      nameHospitalization: json['nom_hospitalisation'],
      dateHospitalization: json['date_hospitalisation'],
      dateEndHospitalization: json['date_fin_hospitalisation'],
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_hospitalisation": nameHospitalization,
        "date_hospitalisation": dateHospitalization,
        "date_fin_hospitalisation": dateEndHospitalization,
        "uuid": uuid,
      };
}
