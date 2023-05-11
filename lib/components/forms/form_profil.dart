import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resk_you_mobile/components/inputs/date_picker.dart';
import 'package:resk_you_mobile/services/interfaces/client/medical_folder.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:resk_you_mobile/services/models/medicalFolder.dart';
import 'package:resk_you_mobile/services/models/user.dart';

class ProfilForm extends StatefulWidget {
  const ProfilForm({super.key});

  @override
  ProfilFormState createState() => ProfilFormState();
}

class ProfilFormState extends State<ProfilForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserClientInterface userClient = UserClientInterface();
  MedicalFolderInterface medicalFolderInterface = MedicalFolderInterface();
//input du form

  int? sexe;

  late User savedProfil;
  late MedicalFolder savedMedicalFolder;

  Future<User> getUserProfil() async {
    User profil = await userClient.getUserProfil();
    savedProfil = profil;
    return profil;
  }

  Future getPublicInfo() async {
    MedicalFolder medicalFolder =
        await medicalFolderInterface.getMedicalFolder();
    savedMedicalFolder = medicalFolder;
    return medicalFolder.publicData;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getUserProfil(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              width: 300,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: snapshot.data?.lastname,
                      onChanged: (value) {
                        savedProfil = savedProfil.copyWith(lastname: value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Nom",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: snapshot.data?.firstname,
                      onChanged: (value) {
                        savedProfil = savedProfil.copyWith(firstname: value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Prenom",
                      ),
                    ),
                    const SizedBox(height: 10),
                    DatePicker(savedProfil),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: 'Sexe',
                      ),
                      items: ['Homme', 'Femme'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        sexe = value == "Homme" ? 1 : 2;
                        savedProfil = savedProfil.copyWith(sexe: sexe);
                      },
                      value: snapshot.data?.sexe == 1 ? "Homme" : "Femme",
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: snapshot.data!.telephone,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        savedProfil = savedProfil.copyWith(telephone: value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Téléphone",
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Adresse",
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: snapshot.data?.address?.addressStreet,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Nom de Rue",
                      ),
                      onChanged: (value) {
                        savedProfil.address =
                            savedProfil.address?.copyWith(addressStreet: value);
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      initialValue: snapshot.data?.address?.addressComplement,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        labelText: "Complément ",
                      ),
                      onChanged: (value) {
                        savedProfil.address = savedProfil.address
                            ?.copyWith(addressComplement: value);
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot
                                  .data?.address?.addressNumber
                                  .toString(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(addressNumber: int.parse(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Numéro de Rue",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot
                                  .data?.address?.addressComplementNumber,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Complément de numéro",
                              ),
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(addressComplementNumber: value);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot
                                  .data?.address?.addressZipcode
                                  .toString(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(
                                        addressZipcode: int.parse(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Code postal",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot
                                          .data!.address?.addressDoorNumber
                                          .toString() ==
                                      "0"
                                  ? ""
                                  : snapshot.data!.address?.addressDoorNumber
                                      .toString(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(
                                        addressDoorNumber: int.parse(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Numéro de porte",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot.data?.address?.addressFloor
                                          .toString() ==
                                      "0"
                                  ? ""
                                  : snapshot.data?.address?.addressFloor
                                      .toString(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(addressFloor: int.parse(value));
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Etage",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue: snapshot.data?.address?.addressCity,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(addressCity: value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Ville",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                            child: TextFormField(
                              initialValue:
                                  snapshot.data?.address?.addressCountry,
                              onChanged: (value) {
                                savedProfil.address = savedProfil.address
                                    ?.copyWith(addressCountry: value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                labelText: "Pays",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        initialValue: snapshot.data!.address?.addressMore,
                        maxLines: 4,
                        onChanged: (value) {
                          savedProfil.address =
                              savedProfil.address?.copyWith(addressMore: value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                          labelText: "Informations complémentaires",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Information publiques",
                      style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "infos visible apres scan QRcode",
                      style: TextStyle(fontSize: 15),
                    ),
                    FutureBuilder(
                        future: getPublicInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return TextFormField(
                              maxLines: 4,
                              initialValue: snapshot.data,
                              onChanged: (value) {
                                savedMedicalFolder = savedMedicalFolder
                                    .copyWith(publicData: value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                              ),
                            );
                          } else {
                            return const Text("loading");
                          }
                        }),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(204, 18, 51, 1.000),
                          minimumSize: const Size(132, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () async {
                        await userClient.putUserProfil(savedProfil);
                        setState(() {});
                      },
                      child: const Text(
                        "Sauvegarder",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          } else {
            return const Text("Loading");
          }
        },
      );
}
