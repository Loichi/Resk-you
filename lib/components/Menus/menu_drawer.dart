import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  static const textSize = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.phone,
              ),
              title: const Text(
                'Appel Secours',
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/home');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.account_circle_outlined,
              ),
              title: const Text(
                'Mes informations',
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/profil');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.access_alarm,
              ),
              title: const Text(
                "Mes contacts d'urgence",
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/emergency_contact');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.all_inbox_rounded,
              ),
              title: const Text(
                "Dossier Medical",
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/medical_folder');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.add_location_rounded,
              ),
              title: const Text(
                "Mes Balises",
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/balises');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.add_location_outlined,
              ),
              title: const Text(
                "Mon Tag",
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/my_tag');
              },
            ),
            ListTile(
              leading: const Icon(
                size: 30,
                Icons.book,
              ),
              title: const Text(
                "Manuel Premier secours",
                style: textSize,
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed("/first_aid");
              },
            )
          ],
        ),
      );
}
