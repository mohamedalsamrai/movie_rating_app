import 'package:flutter/material.dart';
import 'package:movie_rating_app/utils/constants.dart';

class CustomFormInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? initialValue;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool isPasswordField;
  final Function()? onTap;
  final Function(String)? onChanged;

  const CustomFormInput(
      {super.key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.suffixIcon,
      this.initialValue,
      this.onTap,
      this.onChanged,
      this.isPasswordField = false});

  @override
  State<CustomFormInput> createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomFormInput> {
  bool hideText = false;

  @override
  void initState() {
    hideText = widget.isPasswordField ? true : false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      obscureText: hideText,
      cursorColor: Colors.white,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        prefixIconColor: Constants.mainColor,
        hintText: widget.hintText,
        suffixIcon: Icon(widget.suffixIcon),
        suffixIconColor: Constants.mainColor,
        hintStyle: const TextStyle(color: Colors.white60),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Constants.mainColor),
            borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
