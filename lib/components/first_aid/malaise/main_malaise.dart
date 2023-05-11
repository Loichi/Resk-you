import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/malaise/medication_check.dart';
import 'package:resk_you_mobile/components/first_aid/malaise/no_medication.dart';
import 'package:resk_you_mobile/components/first_aid/malaise/victim_check.dart';
import 'package:resk_you_mobile/components/first_aid/malaise/with_medication.dart';


class MainMalaise extends StatefulWidget {
  const MainMalaise({super.key});

  @override
  MainMalaiseState createState() => MainMalaiseState();
}

class MainMalaiseState extends State<MainMalaise> {
  String state = "victim_check";

  @override
  initState() {
    changePage(state);
    super.initState();
  }

  changeState(String newState) {
    setState(
      () {
        state = newState;
        changePage(state);
      },
    );
  }

  var page;

  changePage(state) {
    if (state == "victim_check") {
      page = VictimeCheck(
        updateState: changeState,
      );
    }
    if (state == "medication_check") {
      page = MedicationCheck(
        updateState: changeState,
      );
    }
    if (state == "with_medication") {
      page = WithMedication(
        updateState: changeState,
      );
    }
    if (state == "no_medication") {
      page = NoMedication(
        updateState: changeState,
      );
    }
  }

  MainMalaiseState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
