import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';

class EmptyTextField extends StatelessWidget {
  final String hintText;
  final bool? focusNode;
  final double? width;
  final Function(String?) onChanged;
  final double? height;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const EmptyTextField(
      {Key? key,
        this.focusNode = false,
        this.width,
        this.controller,
        this.suffixIcon,
        this.maxLines,
        required this.hintText,
        required this.onChanged,
        this.height,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent));
    return Container(
      width: width ?? 230,
      height: height ?? 45,
      child: TextField(
        controller: controller,
        autofocus: focusNode!,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(
            fontSize: 30
          ),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder:
          border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}