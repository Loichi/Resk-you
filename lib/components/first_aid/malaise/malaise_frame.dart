import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';

import 'package:resk_you_mobile/components/first_aid/malaise/main_malaise.dart';

class MalaiseFrame extends StatelessWidget {
  const MalaiseFrame({super.key});

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
            child: Text(
              "Malaise".toUpperCase(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Flexible(
              child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.95,
            alignment: Alignment.center,
            child: MainMalaise(),
          )),
        ],
      )),
    );
  }
}
