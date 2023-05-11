import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/forms/form_profil.dart';
import 'package:resk_you_mobile/services/interfaces/client/qrcode.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  ProfilViewState createState() => ProfilViewState();
}

class ProfilViewState extends State<ProfilView> {
  UserClientInterface userClientInterface = UserClientInterface();
  QrCodeInterface qrCode = QrCodeInterface();
  File? image;

  Future getPictureFromApi() async {
    final data = userClientInterface.getPicture();
    return data;
  }

  /// prends l'image sélectionnée soit via la caméra soit la gellerie et la sauvegarde en BDD
  /// via la fonction postPicture qui prend en argument le chemin d'accès de l'image.
  Future pickPicture(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) {
        return log("image null");
      }
      final imagePath = await userClientInterface.postPicture(File(image.path));

      if (imagePath != null) {
        setState(() {
          this.image = File(imagePath);
        });
      } else {
        log("Failed to upload image");
      }
    } on PlatformException catch (error) {
      log("Failed to pick image: $error");
    }
  }

  /// définition d'un thème au widget ElevatedButton
  Widget buildElevatedButton({
    required String title,
    required IconData icon,
    required onClicked,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text(
                  "Mon Profil",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                FutureBuilder(
                    future: getPictureFromApi(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ClipOval(
                          child: Image.memory(
                            snapshot.data,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                const SizedBox(height: 30),
                buildElevatedButton(
                  title: "choisir dans la gallerie",
                  icon: Icons.image_outlined,
                  onClicked: () async {
                    return await pickPicture(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 24),
                buildElevatedButton(
                    title: "prendre une photo",
                    icon: Icons.camera_alt_outlined,
                    onClicked: () async {
                      return await pickPicture(ImageSource.camera);
                    }),
                const SizedBox(height: 30),

                /// component du formulaire de profil
                const ProfilForm(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
