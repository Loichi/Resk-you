import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/lists/custom_list.dart';

class EmergencyContactView extends StatefulWidget {
  const EmergencyContactView({super.key});

  @override
  EmergencyContactViewState createState() => EmergencyContactViewState();
}

class EmergencyContactViewState extends State<EmergencyContactView> {
  String page = "emergency";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              Icon(
                Icons.phone_in_talk,
                color: Colors.black,
                size: 100,
              ),
              Text(
                "Personnes à contacter ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              Text(
                "en cas d'urgence",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CustomList(page),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: (() {}),
                    child: Row(
                      children: const [
                        Icon(Icons.person_add_alt_1),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Ajouter")
                      ],
                    ))
              ],
            ),
          )
        ],
      ))),
    );
  }
}
