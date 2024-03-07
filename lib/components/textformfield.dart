import 'package:catalog_app/Widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextForm extends StatelessWidget {

  String hint;
  String label;
  bool obsecur;
  Function(String)? onchange;
  String? Function(String?)? validates;

  TextForm({
    required this.hint,
    required this.label,
    this.obsecur = false,
    this.onchange,
    this.validates,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      child: TextFormField(
        style: TextStyle(color: (context.primaryColor)),
        validator: validates,
        onChanged: onchange,
        obscureText: obsecur,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          labelStyle: TextStyle(color: context.primaryColor),
          hintStyle: TextStyle(color: (context.theme.primaryColor)),
        ),
      ),
    );
  }
}
