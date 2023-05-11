class Contact {
  final id;
  final String idUser;
  final String lastname;
  final String firstname;
  final String telephone;
  final bool contactPro;
  final contactIndex;

  Contact(
      {required this.id,
      required this.idUser,
      required this.lastname,
      required this.firstname,
      required this.telephone,
      required this.contactPro,
      required this.contactIndex});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      idUser: json['id_user'],
      lastname: json['nom'],
      firstname: json['prenom'],
      telephone: json['telephone'],
      contactPro: json['contact_pro'],
      contactIndex: json['contact_index'],
    );
  }

    Map<String, dynamic> toJson() => {
    "id" : id,
    "id_user": idUser,
    "nom": lastname,
    "prenom": firstname,
    "telephone": telephone,
    "contact_pro": contactPro,
    "contact_index": contactIndex,

  };
}
