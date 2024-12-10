import 'package:flutter/material.dart';
import 'package:movie_rating_app/utils/dimens.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    {
      super.key,
      required this.text,
      required this.color,
      required this.onTap
    }
  );

  final String text;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.getAppDimens(context).customButtonHeight,
      width: double.infinity,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimens.getAppDimens(context).fontSize18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}