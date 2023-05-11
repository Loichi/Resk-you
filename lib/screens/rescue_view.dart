import 'package:flutter/material.dart';

//Imports Menus
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';

//Import Liste
import '../components/lists/custom_list.dart';

class RescueView extends StatefulWidget {
  const RescueView({super.key});

  @override
  RescueViewState createState() => RescueViewState();
}

class RescueViewState extends State<RescueView> {
  String page = "rescue";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: Center(
            child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Column(
                children: const [
                  Icon(
                    Icons.location_on_sharp,
                    color: Color.fromRGBO(204, 18, 51, 1.000),
                    size: 100,
                  ),
                  Text(
                    "Secours",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(204, 18, 51, 1.000),
                        fontSize: 20),
                  ),
                  Text(
                    "Emplacement de l'urgence",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22),
                  ),
                ],
              )),
              Container(
                child: CustomList(page),
              )
            ],
          ),
        )),
      ),
    );
  }
}
