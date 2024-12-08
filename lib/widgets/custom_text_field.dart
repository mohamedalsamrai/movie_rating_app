import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.isPassField,
      required this.controller,
      required this.onChanged});
  final String hintText;
  final String prefixIcon;
  final bool? isPassField;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passState = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: widget.isPassField != null ? passState : false,
        style: const TextStyle(color: Color(0xffffffff)),
        cursorColor: const Color(0xffFFCC00),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(133, 84, 84, 86)),
          suffixIcon: widget.isPassField != null
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          passState = !passState;
                        });
                      },
                      icon: passState
                          ? SvgPicture.asset("assets/icons/close_eye.svg")
                          : SvgPicture.asset("assets/icons/open_eye.svg")))
              : const SizedBox(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              widget.prefixIcon,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.3, color: Color(0xffFFCC00))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  width: 1.3, color: Color.fromARGB(133, 84, 84, 86))),
        ),
      ),
    );
  }
}
