class Disease {
  final id;
  String diseaseName;
  String dateDisease;
  String? dateEndDisease;
  String uuid;

  /// diseaseName = nom_maladie
  /// dateDisease = date_maladie
  /// dateEndDisease = date_fin_maladie

  Disease(
      {required this.id,
      required this.diseaseName,
      required this.dateDisease,
      this.dateEndDisease,
      required this.uuid});

  Disease copyWith({
    String? id,
    String? diseaseName,
    String? dateDisease,
    String? dateEndDisease,
    String? uuid,
  }) {
    return Disease(
      id: id ?? this.id,
      diseaseName: diseaseName ?? this.diseaseName,
      dateDisease: dateDisease ?? this.dateDisease,
      dateEndDisease: dateEndDisease ?? this.dateDisease,
      uuid: uuid ?? this.uuid,
    );
  }

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'],
      diseaseName: json['nom_maladie'],
      dateDisease: json['date_maladie'],
      dateEndDisease: json['date_fin_maladie'],
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_maladie": diseaseName,
        "date_maladie": dateDisease,
        "date_fin_maladie": dateEndDisease,
        "uuid": uuid,
      };
}
