import 'package:flutter/material.dart';
import '../../services/interfaces/client/medical_folder.dart';
import '../../services/models/medicalFolder.dart';

class DropdownBloodGroups extends StatefulWidget {
  MedicalFolder savedMedicalFolder;
  final List list;
  DropdownBloodGroups(this.savedMedicalFolder, this.list, {super.key});

  @override
  State<DropdownBloodGroups> createState() => DropdownBloodGroupsState();
}

class DropdownBloodGroupsState extends State<DropdownBloodGroups> {
  MedicalFolderInterface medicalFolderInterface = MedicalFolderInterface();

  Future getBloodGroup() async {
    MedicalFolder medicalFolder =
        await medicalFolderInterface.getMedicalFolder();
    return medicalFolder.bloodGroup;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBloodGroup(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DropdownButton<String>(
            value: widget.savedMedicalFolder.bloodGroup ?? "",
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              setState(() {
                widget.savedMedicalFolder.bloodGroup = value;
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        } else {
          return const Text("chargement...");
        }
      },
    );
  }
}
