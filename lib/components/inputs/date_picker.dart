import 'package:flutter/material.dart';
import 'package:resk_you_mobile/services/interfaces/client/user.dart';
import 'package:resk_you_mobile/services/models/user.dart';

class DatePicker extends StatefulWidget {
  DatePicker(this.profil, {super.key});
  User profil;
  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  TextEditingController dateCtl = TextEditingController();
  UserClientInterface userClient = UserClientInterface();

  Future<DateTime?> getBirthDate() async {
    return widget.profil.birthDate;
  }

  late DateTime? savedDate = null;
  DateTime? birthDate;
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getBirthDate(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          } else {
            DateTime? birthDate = snapshot.data;

            return TextFormField(
              //editing controller of this TextField
              //formating date to remove the hour part but it's still display as en DateTime
              initialValue: savedDate != null
                  ? "${savedDate?.day.toString()}-${savedDate?.month.toString()}-${savedDate?.year.toString()}"
                  : "${widget.profil.birthDate?.day.toString()}-${widget.profil.birthDate?.month.toString()}-${widget.profil.birthDate?.year.toString()}",
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
                  ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: birthDate ?? DateTime(2000),
                      firstDate: DateTime.parse("19000101"),
                      lastDate: DateTime.now(),
                      currentDate: savedDate ?? birthDate,
                    ) ??
                    DateTime.now();
//when click we have to show the datepicker
                setState(() => savedDate =  DateTime.parse("${pickedDate}Z"));
                dateCtl.text = savedDate!.toIso8601String();
                widget.profil.birthDate = savedDate;
              },
            );
          }
        },
      );
}
// créé une donnée tampon 