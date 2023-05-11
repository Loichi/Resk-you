import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/medical_folder.dart';
import 'package:resk_you_mobile/services/models/medicalFolder.dart';

class RadioComponenent extends StatefulWidget {
  MedicalFolder savedMedicalFolder;

  RadioComponenent(this.savedMedicalFolder, {super.key});

  @override
  State<RadioComponenent> createState() => RadioComponenentState();
}

class RadioComponenentState extends State<RadioComponenent> {
  bool? answer;
  MedicalFolderInterface medicalFolderInterface = MedicalFolderInterface();

  Future getHandicapDeafMute() async {
    MedicalFolder medicalFolder =
        await medicalFolderInterface.getMedicalFolder();
    answer = medicalFolder.deafMute;
    return medicalFolder.deafMute;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getHandicapDeafMute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: true,
                      groupValue: widget.savedMedicalFolder.deafMute ?? answer,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            widget.savedMedicalFolder.deafMute = value;
                          },
                        );
                      },
                    ),
                    const Text("oui"),
                    const SizedBox(width: 15),
                    Radio(
                      value: false,
                      groupValue: widget.savedMedicalFolder.deafMute ?? answer,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            widget.savedMedicalFolder.deafMute = value;
                          },
                        );
                      },
                    ),
                    const Text("non"),
                  ],
                ),
              ),
            );
          } else {
            return const Text("Loading");
          }
        });
  }
}
