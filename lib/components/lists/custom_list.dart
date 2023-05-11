import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/lists/beacons_list_item.dart';
import 'package:resk_you_mobile/components/lists/emergency_item_list.dart';
import 'package:resk_you_mobile/services/interfaces/client/beacon.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'rescue_item_list.dart';
import 'package:geolocator/geolocator.dart';

class CustomList extends StatefulWidget {
  String page;

  CustomList(this.page, {super.key});

  @override
  CustomListState createState() => CustomListState();
}

class CustomListState extends State<CustomList> {
  UserClientInterface userClientInterface = UserClientInterface();
  BeaconClientInterface beaconClientInterface = BeaconClientInterface();

  Future getView() async {
    if (widget.page == "rescue" || widget.page == "balises") {
      final data = await beaconClientInterface.getBeacons();

      return data;
    } else {
      final data = await userClientInterface.getUserProfil();
      print(data);
      return data.contacts;
    }
  }

  //methode qui recupere la geoloc
  Future<Position> getGeoloc() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)?.settings.arguments;
    return FutureBuilder(
        future: getView(),
        builder: (context, AsyncSnapshot snapshot) {
          if (widget.page == "rescue" &&
              snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var balise in snapshot.data)
                      InkWell(
                        onTap: (() => Navigator.of(context)
                            .pushNamed('/call', arguments: value)),
                        child: RescueListItemView("balise", balise),
                      ),
                    InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, "/call", arguments: value)
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(children: [
                          Container(
                            color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: const Icon(
                              Icons.location_pin,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(children: const [
                                    Text("Utiliser localisation GPS"),
                                  ]),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            );
          } else if (widget.page == "emergency" &&
              widget.page == "emergency" &&
              snapshot.connectionState == ConnectionState.done) {
            return FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    for (var contact in snapshot.data)
                      EmergencyListItem(contact),
                    const FractionallySizedBox(
                      widthFactor: 0.9,
                    ),
                    const SizedBox(height: 10)
                  ],
                ));
          } else if (widget.page == "balises" &&
              snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    for (var balise in snapshot.data)
                      Column(
                        children: [
                          InkWell(
                            onTap: (() => Navigator.of(context).pushNamed(
                                '/detail_balise',
                                arguments: balise)),
                            child: BeaconListItemView("balise", balise),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    for (var balise in snapshot.data)
                      Column(
                        children: [
                          InkWell(
                            onTap: (() => Navigator.of(context).pushNamed(
                                '/detail_balise',
                                arguments: balise)),
                            child: BeaconListItemView("balise", balise),
                          ),
                          const SizedBox(height: 10)
                        ],
                      )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
