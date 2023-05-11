import 'package:flutter/material.dart';

class FormPasswordInputView extends StatefulWidget {
  final label;
  const FormPasswordInputView(this.label, {super.key});

  @override
  FormPasswordInputState createState() => FormPasswordInputState();
}

class FormPasswordInputState extends State<FormPasswordInputView> {
  bool visibility = true;

  String password = "";

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            onChanged: (value) => password = value,
            obscureText: visibility,
            decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: InkWell(
                onTap: () => setState(() {
                  visibility = !visibility;
                }),
                child:
                    Icon(!visibility ? Icons.visibility : Icons.visibility_off),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          const SizedBox(height: 5)
        ],
      );
}
