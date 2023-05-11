import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/buttons/dropdown_blood_groups.dart';
import 'package:resk_you_mobile/components/buttons/radio.dart';
import 'package:resk_you_mobile/services/interfaces/client/medical_folder.dart';
import 'package:resk_you_mobile/services/models/allergie.dart';
import 'package:resk_you_mobile/services/models/disease.dart';
import 'package:resk_you_mobile/services/models/hospitalization.dart';
import 'package:resk_you_mobile/services/models/medicalFolder.dart';
import 'package:resk_you_mobile/services/models/priors.dart';
import 'package:resk_you_mobile/services/models/treatment.dart';

class MedicalForm extends StatefulWidget {
  const MedicalForm({super.key});

  @override
  MedicalFormState createState() => MedicalFormState();
}

class MedicalFormState extends State<MedicalForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MedicalFolderInterface medicalFolderInterface = MedicalFolderInterface();
  late List<Disease>? diseases = [];
  late List<Hospitalization>? hospitalizations = [];
  late List<Allergie>? allergies = [];
  late List<Priors>? priors = [];
  late List<Treatment>? treatments = [];

  late MedicalFolder savedMedicalFolder;

  Future<MedicalFolder> getMedicalFolder() async {
    MedicalFolder medicalFolder =
        await medicalFolderInterface.getMedicalFolder();
    savedMedicalFolder = medicalFolder;
    diseases = savedMedicalFolder.diseases;
    hospitalizations = savedMedicalFolder.hospitalizations;
    allergies = savedMedicalFolder.allergies;
    priors = savedMedicalFolder.priors;
    treatments = savedMedicalFolder.ongoingTreatment;

    return medicalFolder;
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  late int index;

// liste des maladies
  disease() {
    return ListView.builder(
      itemCount: diseases!.length,
      itemBuilder: ((context, index) {
        return Container(
          child: TextFormField(
            initialValue: diseases != null ? diseases![index].diseaseName : "",
            onFieldSubmitted: (value) {
              savedMedicalFolder.diseases?[index].diseaseName = value;
            },
          ),
        );
      }),
    );
  }

  hospitalization() {
    return ListView.builder(
      itemCount: hospitalizations!.length,
      itemBuilder: ((context, index) {
        return Column(children: [
          Container(
            color: Colors.blue[100],
            child: Column(
              children: [
                TextFormField(
                  initialValue: hospitalizations != null
                      ? hospitalizations![index].nameHospitalization
                      : "",
                  onChanged: (value) {
                    savedMedicalFolder
                        .hospitalizations?[index].nameHospitalization = value;
                  },
                ),
                TextFormField(
                  initialValue: hospitalizations != null
                      ? "Date debut : ${hospitalizations![index].dateHospitalization.substring(0, 10)}"
                      : "",
                  onChanged: (value) {
                    savedMedicalFolder
                        .hospitalizations?[index].dateHospitalization = value;
                  },
                ),
                TextFormField(
                  initialValue: hospitalizations != null
                      ? "Date fin : ${hospitalizations![index].dateEndHospitalization.substring(0, 10)}"
                      : "",
                  onChanged: (value) {
                    savedMedicalFolder.hospitalizations?[index]
                        .dateEndHospitalization = value;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ]);
      }),
    );
  }

  allergie() {
    return ListView.builder(
      itemCount: allergies!.length,
      itemBuilder: ((context, index) {
        return SizedBox(
          height: 50,
          child: TextFormField(
            initialValue: allergies![index].nameAllergie,
            onFieldSubmitted: (value) {
              savedMedicalFolder.allergies?[index].nameAllergie = value;
            },
          ),
        );
      }),
    );
  }

// liste des antécédents
  prior() {
    return ListView.builder(
        itemCount: priors!.length,
        itemBuilder: ((context, index) {
          return SizedBox(
            height: 50,
            child: TextFormField(
              initialValue:
                  priors != null ? priors![index].descriptionPriors : "",
              onFieldSubmitted: (value) {
                savedMedicalFolder.priors?[index].descriptionPriors = value;
              },
            ),
          );
        }));
  }

// liste des traitements en cours
  onGoingTreatment() {
    return ListView.builder(
      itemCount: treatments!.length,
      itemBuilder: ((context, index) {
        return SizedBox(
          height: 50,
          child: TextFormField(
            initialValue: treatments![index].ongoingTreatment,
            onFieldSubmitted: (value) {
              savedMedicalFolder.ongoingTreatment?[index].ongoingTreatment =
                  value;
            },
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getMedicalFolder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text("Maladie(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        height: diseases!.length * 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: disease(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text("Hospitalisation(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        height: hospitalizations!.length * 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: hospitalization(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text(
                        "Traitement en cours",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        height: treatments!.length * 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: onGoingTreatment(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text("Antécédent(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        height: priors!.length * 50,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: prior(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text("Allergie(s)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                          height: allergies!.length * 50,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: allergie()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text("Groupe sanguin :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      DropdownBloodGroups(savedMedicalFolder, const [
                        "AB+",
                        "AB-",
                        "A+",
                        "A-",
                        "B+",
                        "B-",
                        "O+",
                        "O-"
                      ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Row(
                          children: [
                            const Text("sourd/muet :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            RadioComponenent(savedMedicalFolder)
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text(
                        "Handicap",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          initialValue: snapshot.data?.handicap ?? "",
                          onChanged: (value) {
                            savedMedicalFolder =
                                savedMedicalFolder.copyWith(handicap: value);
                          },
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text(
                        "Informations complémentaires",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                            initialValue:
                                snapshot.data?.complementaryInformation,
                            onChanged: (value) {
                              savedMedicalFolder = savedMedicalFolder.copyWith(
                                  complementaryInformation: value);
                            }),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      const Text(
                        "Remarques",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                            initialValue: snapshot.data?.remark,
                            onChanged: (value) {
                              savedMedicalFolder =
                                  savedMedicalFolder.copyWith(remark: value);
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(104, 18, 51, 1.000),
                            minimumSize: const Size(131, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          await medicalFolderInterface
                              .putMedicalFolder(savedMedicalFolder);
                          setState(() {});
                        },
                        child: const Text(
                          "valider",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text("Chargement...");
          }
        },
      );
}
