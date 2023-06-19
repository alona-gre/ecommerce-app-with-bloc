import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10.0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
