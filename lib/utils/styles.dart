import 'package:flutter/material.dart';
import 'package:movie_rating_app/utils/dimens.dart';

// This class will contain frequent TextStyles throughout the app.

class AppStyles {
  static TextStyle searchedMovieDetail(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: Dimens.getAppDimens(context).fontSize11,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700
  );
}