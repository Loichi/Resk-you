import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import '../components/buttons/service_button.dart';

final List services = [
  Service("18 - POMPIER", const Color.fromRGBO(204, 18, 51, 1.000),
      Icons.fire_truck_sharp, "tel:18"),
  Service(
      "15 - SAMU", const Color(0xFFFFFFFF), Icons.emergency_outlined, "tel:15"),
  Service("17 - FORCES DE L'ORDRE", const Color(0xFF096BAE), Icons.local_police,
      "tel:17"),
];

class Home extends StatelessWidget {
  const Home({super.key});

  Widget getServiceButton(List services) {
    List<Widget> listServices = [];
    for (var service in services) {
      listServices.add(ServiceButton(service));
    }
    return Column(
      children: listServices,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const MenuAppBar(),
        drawer: const MenuDrawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Column(
                  children: const [
                    Text("QUEL SERVICE VOULEZ-VOUS JOINDRE ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              getServiceButton(services),
            ],
          ),
        ));
  }
}
