import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';

class FilledTextField extends StatelessWidget {
  final bool obscureText;
  final Widget? suffix;
  final String? hintText;
  final bool pass;
  final String? label;
  final Function? onSuffixPressed;
  final String? Function(String?) validator;
  final Function(String?) onChanged;
  const FilledTextField(
      {Key? key,
        required this.onChanged,
        required this.validator,
        this.label,
        this.onSuffixPressed,
        this.suffix,
         this.obscureText = false,
         this.pass = false,
         this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue));
    var errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red));

    return Container(
      width: 350,
      child: Center(
        child: TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText ?? null,
            label: label == null ? null : Text(label!),
            suffixIcon: pass
                ? GestureDetector(
              onTap: () {
                onSuffixPressed!();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: suffix,
              ),
            )
                : null,
            border: border,
            enabledBorder: border,
            errorBorder: errorBorder,
            focusedBorder: border,
            filled: true,
            fillColor: Color(0xffF5F5F5),
          ),
          validator: validator,
        ),
      ),
    );
  }
}