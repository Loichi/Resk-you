import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final label;

  FormInput(this.label, {super.key});

  String valueInput = "";

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            onChanged: (value) => valueInput = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              labelText: label,
            ),
          ),
          const SizedBox(height: 30)
        ],
      );
}
