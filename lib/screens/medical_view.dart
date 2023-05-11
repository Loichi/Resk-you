import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/forms/form_medical.dart';
import 'package:resk_you_mobile/services/interfaces/client/medical_folder.dart';
import 'package:resk_you_mobile/services/interfaces/client/qrcode.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:resk_you_mobile/services/models/medicalFolder.dart';
import '../services/interfaces/company/user.dart';

class MedicalView extends StatefulWidget {
  const MedicalView({super.key});

  @override
  MedicalViewState createState() => MedicalViewState();
}

class MedicalViewState extends State<MedicalView> {
  UserCompanyInterface userCompanyInterface = UserCompanyInterface();
  UserClientInterface userClientInterface = UserClientInterface();
  QrCodeInterface qrCode = QrCodeInterface();
  MedicalFolderInterface medicalFolderInterface = MedicalFolderInterface();
  late MedicalFolder savedMedicalFolder;

  Future<MedicalFolder> getMedicalFolder() async {
    MedicalFolder medicalFolder =
        await medicalFolderInterface.getMedicalFolder();
    savedMedicalFolder = medicalFolder;
    return medicalFolder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Column(
                children: const [
                  Icon(Icons.folder, size: 100),
                  Text(
                    "Dossier Médical",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 60),
                  MedicalForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
