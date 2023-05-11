import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/components/first_aid/defibrillator/main_defibrillator.dart';

class DefibrillatorFrame extends StatelessWidget {
  const DefibrillatorFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: Center(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            child: Text(
              "Utiliser un defibrilateur ".toUpperCase(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.95,
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: MainDefibrillator(),
                )),
          )
        ],
      )),
    );
  }
}
