import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";

class Service {
  String text;
  Color color;
  IconData icon;
  String tel;

  Service(this.text, this.color, this.icon, this.tel);
}

class ServiceButton<Widget> extends StatefulWidget {
  const ServiceButton(this.service, {super.key});
  final Service service;

  @override
  ServiceButtonState createState() => ServiceButtonState();
}

class ServiceButtonState extends State<ServiceButton> {
  //states?

  late Color textColor;
  late Color borderColor;

  @override
  void initState() {
    super.initState();
    borderSelect();
  }

  borderSelect() {
    widget.service.color == Colors.white
        ? setState(() {
            textColor = const Color(0xFF096BAE);
            borderColor = const Color(0xFF096BAE);
          })
        : setState(() {
            textColor = const Color.fromARGB(255, 255, 255, 255);
            borderColor = const Color.fromARGB(0, 255, 255, 255);
          });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: widget.service.color,
                    side: BorderSide(width: 2.0, color: borderColor),
                    alignment: Alignment.center),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/rescue', arguments: widget.service.tel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.phone_fill,
                      color: textColor,
                      size: 30.0,
                    ),
                    Text(widget.service.text,
                        style: TextStyle(color: textColor, fontSize: 20)),
                    Icon(
                      widget.service.icon,
                      color: textColor,
                      size: 35.0,
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 30,
          )
        ],
      );
}
