import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/lists/custom_list.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/buttons/simple_button.dart';
import 'package:resk_you_mobile/components/inputs/form_input.dart';
import 'package:resk_you_mobile/components/lists/beacon_detail_item.dart';

class BeaconsView extends StatefulWidget {
  const BeaconsView({super.key});

  @override
  BeaconsState createState() => BeaconsState();
}

class BeaconsState extends State<BeaconsView> {
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
              const Icon(
                Icons.location_on_sharp,
                color: Colors.black,
                size: 80,
              ),
              const Text(
                "Mes Balises",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                child: CustomList("balises"),
              )
            ])),
      ),
    );
  }
}
