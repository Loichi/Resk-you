import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/qrcode.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:resk_you_mobile/services/models/user.dart';
import '../components/menus/menu_appbar.dart';
import '../components/menus/menu_drawer.dart';

class MyTagView extends StatefulWidget {
  const MyTagView({super.key});

  @override
  MyTagState createState() => MyTagState();
}

class MyTagState extends State<MyTagView> {
  UserClientInterface userClient = UserClientInterface();

  Future<User> getProfil() async {
    User user = await userClient.getUserProfil();

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: FutureBuilder(
        future: getProfil(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "mon tag".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const QrCode(),
                        Text(
                          snapshot.data!.idHelppLife,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${snapshot.data?.firstname} ${snapshot.data?.lastname} ",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Flashez ce qr code pour consulter les informations accessibles publiquement.",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey),
                          ),
                        )
                      ]),
                ),
              ),
            );
          } else {
            return const Text("chargement..");
          }
        }),
      ),
    ));
  }
}
