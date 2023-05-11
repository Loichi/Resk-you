class Allergie {
  final id;
  String nameAllergie;
  String uuid;

  /// nameAllergie = nom_allergie

  Allergie({
    required this.id,
    required this.nameAllergie,
    required this.uuid,
  });

  Allergie copyWith({
    String? id,
    String? nameAllergie,
    String? uuid,
  }) {
    return Allergie(
      id: id ?? this.id,
      nameAllergie: nameAllergie ?? this.nameAllergie,
      uuid: uuid ?? this.uuid,
    );
  }

  factory Allergie.fromJson(Map<String, dynamic> json) {
    return Allergie(
      id: json['id'],
      nameAllergie: json['nom_allergie'],
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_allergie": nameAllergie,
        "uuid": uuid,
      };

  @override
  String toString() {
    return "nom : $nameAllergie";
  }
}
