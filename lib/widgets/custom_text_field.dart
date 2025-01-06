import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
    {
      super.key,
      required this.hintText,
      required this.prefixIcon,
      this.isPassField,
      required this.controller,
      required this.onChanged
    }
  );

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
      height: Dimens.getAppDimens(context).customTextFieldHeight,
      child: TextFormField(
        validator: (value) {
        if (value!.isEmpty) {
          return "the value is empty";
        }},
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: widget.isPassField != null ? passState : false,
        style: const TextStyle(color: Colors.white),
        cursorColor: Constants.mainColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Constants.customTextFieldColor),
          suffixIcon: widget.isPassField != null
            ? Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  setState(() { passState = !passState; });
                },
                icon: passState
                  ? SvgPicture.asset("assets/icons/close_eye.svg")
                  : SvgPicture.asset("assets/icons/open_eye.svg")
              )
            ) : const SizedBox(),
          prefixIcon: Padding(
            padding: EdgeInsets.all(Dimens.getAppDimens(context).padding10),
            child: SvgPicture.asset(widget.prefixIcon),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimens.getAppDimens(context).radius8
            ),
            borderSide: BorderSide(
              width: Dimens.getAppDimens(context).customTextFieldBorder,
              color: Constants.mainColor
            )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimens.getAppDimens(context).radius8
              ),
            borderSide: BorderSide(
              width: Dimens.getAppDimens(context).customTextFieldBorder,
              color: Constants.customTextFieldColor
            )
          ),
        ),
      ),
    );
  }
}
