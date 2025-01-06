import 'package:flutter/material.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/styles.dart';

class ProfileTextFiled extends StatefulWidget {
  final bool? isDatefiled;
  final TextEditingController controller;
  final String hintText;
  final bool? readOnly;
  const ProfileTextFiled({
    super.key,
    this.isDatefiled,
    required this.controller,
    required this.hintText,
    this.readOnly,
  });

  @override
  State<ProfileTextFiled> createState() => _ProfileTextFiledState();
}

class _ProfileTextFiledState extends State<ProfileTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          style: AppStyles.searchedMovieDetail(context).copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 13,
        ),
        SizedBox(
          height: 44,
          child: TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Constants.mainColor,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Constants.customTextFieldColor),
              suffixIcon: widget.isDatefiled != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () async {
                            DateTime? tame = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050));
                            tame != null
                                ? widget.controller.text =
                                    tame.toString().substring(0, 10)
                                : '';
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Constants.mainColor,
                          )))
                  : const SizedBox(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.getAppDimens(context).radius8),
                  borderSide: BorderSide(
                      width: Dimens.getAppDimens(context).customTextFieldBorder,
                      color: Constants.mainColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.getAppDimens(context).radius8),
                  borderSide: BorderSide(
                      width: Dimens.getAppDimens(context).customTextFieldBorder,
                      color: Colors.grey.shade800)),
            ),
          ),
        ),
      ],
    );
  }
}