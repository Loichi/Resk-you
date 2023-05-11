import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  final storage = const FlutterSecureStorage();

  void _showLogoutConfirmationDialog(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Êtes-vous sûr de vouloir vous déconnecter?",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("Annuler"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      child: Text("Déconnexion"),
                      onPressed: () {
                        logOut();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  logOut() async {
    await storage.deleteAll();
    Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) => AppBar(
        leading: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 35,
            )),
        title: Center(
          child: Image.network(
            "https://resk-you.fr/wp-content/uploads/2022/10/logo-resk-you.png",
            height: 15,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => _showLogoutConfirmationDialog(context),
            child: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          )
        ],
        backgroundColor: const Color(0xFF1E1E1E),
      );
}
