import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/burn/explanations.dart';
import 'package:resk_you_mobile/components/first_aid/burn/not_thermal.dart';
import 'package:resk_you_mobile/components/first_aid/burn/severity.dart';
import 'package:resk_you_mobile/components/first_aid/burn/small_burn.dart';
import 'package:resk_you_mobile/components/first_aid/burn/thermal.dart';
import 'package:resk_you_mobile/components/first_aid/burn/thermal_check.dart';

class MainBurn extends StatefulWidget {
  const MainBurn({super.key});

  @override
  MainBurnState createState() => MainBurnState();
}

class MainBurnState extends State<MainBurn> {
  String state = "explanations";

  @override
  initState() {
    super.initState();
    changePage(state);
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
    if (state == "explanations") page = Explanations(updateState: changeState);
    if (state == "severity") page = Severity(updateState: changeState);
    if (state == "thermal_check") page = ThermalCheck(updateState: changeState);
    if (state == "small_burn") page = SmallBurn(updateState: changeState);
    if (state == "not_thermal") page = NotThermal(updateState: changeState);
    if (state == "thermal") page = Thermal(updateState: changeState);
  }

  MainBurnState();

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
