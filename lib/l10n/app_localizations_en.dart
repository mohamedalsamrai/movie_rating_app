// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Movie App';

  @override
  String get filmz => 'Filmz';

  @override
  String get filmzSubtitle =>
      'Browse and explore rated movies carefully curated for you';

  @override
  String get joinNow => 'Join now';

  @override
  String get signIn => 'Sign in';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signUp => 'Sign up';

  @override
  String get doYouHaveAnAccount => 'Do you have an account? ';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account? ';

  @override
  String get error => 'Error';

  @override
  String get dataNotAvailable => 'Data not available';

  @override
  String get popular => 'Popular';

  @override
  String get action => 'Action';

  @override
  String get searchBarHint => 'Search...';

  @override
  String get searchedMoviesTitle => 'Movies 🎬';
}
