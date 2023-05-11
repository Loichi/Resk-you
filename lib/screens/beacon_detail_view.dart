import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/lists/beacon_detail_item.dart';
import 'package:resk_you_mobile/components/menus/menu_appbar.dart';
import 'package:resk_you_mobile/components/menus/menu_drawer.dart';
import 'package:resk_you_mobile/services/interfaces/client/beacon.dart';
import 'package:resk_you_mobile/services/models/beacon.dart';

class BeaconDetailView extends StatefulWidget {
  const BeaconDetailView({super.key});

  @override
  DetailBaliseViewState createState() => DetailBaliseViewState();
}

class DetailBaliseViewState extends State<BeaconDetailView> {
  BeaconClientInterface beaconClientInterface = BeaconClientInterface();

  String beaconName = "";

  Future getBeaconName(idBeacon) async {
    var beaconName = await beaconClientInterface.getBeaconName(idBeacon);
    return beaconName;
  }

  Future updateBeaconName(idBeacon, updatedName) async {
    await beaconClientInterface.updateBeaconName(idBeacon, updatedName);
  }

  @override
  Widget build(BuildContext context) {
    final Beacon beacon =
        (ModalRoute.of(context)?.settings.arguments as Beacon);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(),
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BeaconDetailItem(beacon),
              const Text(
                "Renommer",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(204, 18, 51, 1.000)),
              ),
              FutureBuilder(
                future: getBeaconName(beacon.id),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextFormField(
                        initialValue: snapshot.data,
                        onChanged: (value) {
                          beaconName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text("chargement..");
                  }
                }),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(204, 18, 51, 1.000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  updateBeaconName(beacon.id, beaconName);
                },
                child: const Text(
                  "Sauvegarder",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
