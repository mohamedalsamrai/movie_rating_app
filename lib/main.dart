import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/di/main_module.dart';
import 'package:movie_rating_app/navigation/router.dart';
import 'package:movie_rating_app/utils/constants.dart';

void main() async {
  final injector = Injector();

  /*
    Links Flutter to the native engine where the app is run, ensuring that the
    initialization is correct.
  */
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Loads environment variables.
  MainModule().initialise(injector); // Initializes Dependency Injection.
  runApp(
    /*
      For widgets to be able to read providers, we need to wrap the entire
      application in a "ProviderScope" widget.
      This is where the state of our providers will be stored.
    */
    ProviderScope(
      overrides: [injectorProvider.overrideWithValue(injector)],
      child: const MovieApp()
    )
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor
      ),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales
    );
  }
}
